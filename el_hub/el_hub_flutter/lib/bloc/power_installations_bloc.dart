import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:el_hub_client/el_hub_client.dart';
import 'package:meta/meta.dart';

import '../main.dart';
import '../utility/logging/logger.dart';

part 'power_installations_event.dart';
part 'power_installations_state.dart';

class PowerInstallationsBloc
    extends Bloc<PowerInstallationsEvent, PowerInstallationsState> {
  final _powerInstallationsStateController =
      StreamController<PowerInstallationsState>.broadcast();

  StreamSink<PowerInstallationsState> get _currentUserPowerInstallationsState =>
      _powerInstallationsStateController.sink;

  Stream<PowerInstallationsState> get powerInstallationStateStream {
    return _powerInstallationsStateController.stream;
  }

  final _eventStreamController = StreamController<PowerInstallationsEvent>();

  StreamSink<PowerInstallationsEvent> get eventSink =>
      _eventStreamController.sink;

  Stream<PowerInstallationsEvent?> get _eventStream =>
      _eventStreamController.stream;

  PowerInstallationsBloc() : super(PowerInstallationsInitial()) {
    _eventStream.listen((event) {
      _mapEventToState(event!);
    });
    _currentUserPowerInstallationsState.add(state);
  }
  Future<void> _mapEventToState(PowerInstallationsEvent event) async {
    await event.execute(state);
    _currentUserPowerInstallationsState.add(state);
  }
}
