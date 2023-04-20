import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';
import '../../utility/logging/logger.dart';
import '../generated/protocol.dart';

class PowerReadIntervalEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<PowerReadInterval>> getPowerReadIntervals(
      Session session, int powerInstallationId,
      {DateTime? getIntervalUntilDateTime}) async {
    Expression ex =
        PowerReadInterval.t.powerInstallationId.equals(powerInstallationId);
    var powerReadIntervals = await PowerReadInterval.find(session,
        where: (t) => ex, useCache: false);

    if (getIntervalUntilDateTime != null) {
      powerReadIntervals = powerReadIntervals
          .where((element) => element.powerReadIntervalEnd.isAfter(getIntervalUntilDateTime) == true)
          .toList();
    }
    return powerReadIntervals;
  }
}
