import 'package:el_hub_client/el_hub_client.dart';
import 'package:el_hub_flutter/bloc/power_installations_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

main() {
  test("Testing PowerInstallationsEventLoad evnent load", () {
    //Setup
    PowerInstallationsState state = PowerInstallationsInitial();
    PowerInstallationsEvent event = PowerInstallationsLoadEvent();

    //Act
    event.execute(state);

    //Assert
    expect(state.powerInstallations.length, 0);
  });
  test("UpdatePowerInstallationDetailsEvent test", () async {
    //Setup
    var client = Client(
  'http://10.0.2.2:8079/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();
var sessionManager = SessionManager(
  caller: client.modules.auth,
);
    PowerInstallation po = PowerInstallation(
        name: "test",
        type: "test",
        componentId: "test",
        powerReadIntervals: []);
    PowerInstallationsState state = PowerInstallationsInitial();
    PowerInstallationsEvent updateEvent = UpdatePowerInstallationDetailsEvent(po);
    PowerInstallationsEvent loadEvent = PowerInstallationsLoadEvent();

    //Act
    await updateEvent.execute(state);
    await loadEvent.execute(state);


    //Assert
    print(state.powerInstallations);
    expect(
        state.powerInstallations.any((element) => element.name == po.name
            // element.type == "test" &&
            // element.componentId == po.componentId &&
            // element.powerReadIntervals == po.powerReadIntervals
            ),
        true);
  });
}
