part of 'power_installations_bloc.dart';

@immutable
abstract class PowerInstallationsState {
  late List<PowerInstallation> powerInstallations;
}

class PowerInstallationsInitial extends PowerInstallationsState {}
