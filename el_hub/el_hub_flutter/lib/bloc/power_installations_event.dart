part of 'power_installations_bloc.dart';

@immutable
abstract class PowerInstallationsEvent {
  final _logger = logger(PowerInstallationsEvent);
  execute(PowerInstallationsState GroupEvent);
}

@immutable
class PowerInstallationsEventLoad extends PowerInstallationsEvent {
  @override
  execute(PowerInstallationsState state) async {
    _logger.d("calling PowerInstallationsLoadEvent.execute");
    state.powerInstallations = await client.powerInstallation
        .getUsersPowerInstallations(
            getIntervalUntilDateTime:
                DateTime.now().subtract(const Duration(minutes: 1)));
  }
}

@immutable
class UpdatePowerReadsEvent extends PowerInstallationsEvent {
  UpdatePowerReadsEvent();
  @override
  execute(PowerInstallationsState state) async {
    _logger.d("calling UpdatePowerReadEvent.execute");
    for (var element in state.powerInstallations) {
      element.powerReadIntervals = await client.powerReadInterval
          .getPowerReadIntervals(element.id!,
              getIntervalUntilDateTime:
                  DateTime.now().subtract(const Duration(minutes: 1)));
    }
  }
}

@immutable
class UpdatePowerInstallationDetailsEvent extends PowerInstallationsEvent{
  final PowerInstallation powerInstallation;
  UpdatePowerInstallationDetailsEvent(this.powerInstallation);
  @override
  execute(PowerInstallationsState state) async {
    _logger.d("calling UpdatePowerInstallationDetailsEvent.execute");
    await client.powerInstallation.updatePowerInstallation(powerInstallation);
    state.powerInstallations = await client.powerInstallation
        .getUsersPowerInstallations(
            getIntervalUntilDateTime:
                DateTime.now().subtract(const Duration(minutes: 1)));
  }
}

@immutable
class DeletePowerInstallationDetailsEvent extends PowerInstallationsEvent{
  final PowerInstallation powerInstallation;
  DeletePowerInstallationDetailsEvent(this.powerInstallation);
  @override
  execute(PowerInstallationsState state) async {
    _logger.d("calling DeletePowerInstallationDetailsEvent.execute");
    await client.powerInstallation.deletePowerInstallation(powerInstallation);
    state.powerInstallations = await client.powerInstallation
        .getUsersPowerInstallations(
            getIntervalUntilDateTime:
                DateTime.now().subtract(const Duration(minutes: 1)));
  }
}
