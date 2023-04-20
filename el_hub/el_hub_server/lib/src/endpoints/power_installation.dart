import 'package:el_hub_server/src/endpoints/power_read_interval.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

import '../../utility/logging/logger.dart';
import '../generated/power_installation.dart';
import '../generated/protocol.dart';

class PowerInstallationEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<PowerInstallation>> getUsersPowerInstallations(Session session,
      {DateTime? getIntervalUntilDateTime}) async {
    //Serverpod doesn't support linq like queries yet, so we have to retrieve all the power installations and filter them in the code.
    //TODO, Fix when serverpod supports linq like queries.

    var powerInstallations =
        await PowerInstallation.find(session, useCache: false);
        
    var userId = await session.auth.authenticatedUserId;
    List<PowerInstallation> usersPowerInstallations = powerInstallations
        .where((h) =>
            h.owners != null &&
            h.owners!.any((element) =>
                element.id == userId))
        .toList();
    for (var element in usersPowerInstallations) {
      element.powerReadIntervals = await PowerReadIntervalEndpoint()
          .getPowerReadIntervals(session, element.id!,
              getIntervalUntilDateTime: getIntervalUntilDateTime);
    }
    return usersPowerInstallations;
  }

  Future<void> addUserToPowerInstallation(
      Session session, int powerInstallationId) async {
    var powerInstallation = await PowerInstallation.findSingleRow(session,
        where: (t) => PowerInstallation.t.id.equals(powerInstallationId));
    if (powerInstallation == null) {
      throw Exception('Power installation not found');
    }
    int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw Exception('User not found');
    }
    var userInfo = await Users.findUserByUserId(session, userId);
    if (userInfo == null) {
      throw Exception('User not found');
    }
    // powerInstallation.owners.add(userInfo);
    await PowerInstallation.update(session, powerInstallation);
  }

  Future<void> createUsersPowerInstallation(Session session) async {
    int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw Exception('User not found');
    }
    var userInfo = await Users.findUserByUserId(session, userId);
    if (userInfo == null) {
      throw Exception('User not found');
    }

    await PowerInstallation.insert(
        session,
        PowerInstallation(
          type: "testType",
          name: 'My Power Installation',
          owners: [userInfo],
        ));
    return;
  }
}
