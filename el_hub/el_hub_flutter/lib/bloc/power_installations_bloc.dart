import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:el_hub_client/el_hub_client.dart';
import 'package:meta/meta.dart';

import '../main.dart';
import '../utility/logging/logger.dart';

part 'power_installations_event.dart';
part 'power_installations_state.dart';

class PowerInstallationsBloc extends Bloc<PowerInstallationsEvent, PowerInstallationsState> {
  final _powerInstallationsStateController = StreamController<PowerInstallationsState>();

  StreamSink<PowerInstallationsState> get _currentUserPowerInstallationsState =>
      _powerInstallationsStateController.sink;

  Stream<PowerInstallationsState> get group {
    return _powerInstallationsStateController.stream;
  }

  final _eventStreamController = StreamController<PowerInstallationsEvent>();

  StreamSink<PowerInstallationsEvent> get eventSink => _eventStreamController.sink;

  Stream<PowerInstallationsEvent?> get eventStream => _eventStreamController.stream;

  PowerInstallationsBloc() : super(PowerInstallationsInitial()) {
    _eventStreamController.stream.listen(_mapEventToState);
    _currentUserPowerInstallationsState.add(state);
  }
  Future<void> _mapEventToState(PowerInstallationsEvent event) async {
    await event.execute(state);
    _currentUserPowerInstallationsState.add(state);
  }
}