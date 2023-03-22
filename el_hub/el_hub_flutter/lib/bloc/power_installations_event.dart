part of 'power_installations_bloc.dart';

@immutable
abstract class PowerInstallationsEvent {
  final log = logger(PowerInstallationsEvent);
  execute(PowerInstallationsState GroupEvent);
}

@immutable
class PowerInstallationsEventLoad extends PowerInstallationsEvent {
  @override
  execute(PowerInstallationsState state) async {
    log.d("calling PowerInstallationsLoadEvent.execute");
    state.powerInstallations =
        await client.powerInstallation.getUsersPowerInstallations();
  }
}
