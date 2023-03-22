import 'package:serverpod/serverpod.dart';

import '../../utility/logging/logger.dart';
import '../generated/power_installation.dart';
import '../generated/protocol.dart';

class PowerInstallationEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<PowerInstallation>> getUsersPowerInstallations(
      Session session) async {
    //Serverpod doesn't support linq like queries yet, so we have to retrieve all the power installations and filter them in the code.
    //TODO, Fix when serverpod supports linq like queries.
    var powerInstallations = await PowerInstallation.find(session);

    var usersPowerInstallations = powerInstallations
        .where((h) => h.owners
            .any((element) => element.id == session.auth.authenticatedUserId))
        .toList();
    var log = logger(PowerInstallationEndpoint);
    log.d(usersPowerInstallations.toString());
    return usersPowerInstallations;
  }

  Future<String> hello(Session session, String name) async {
    print(await session.auth.authenticatedUserId);
    session.serverpod.futureCallWithDelay(
        "ExampleFutureCall", null, Duration(minutes: 3, seconds: 2));

    return 'Hello $name';
  }
}
