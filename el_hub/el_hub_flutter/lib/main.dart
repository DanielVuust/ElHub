import 'package:el_hub_client/el_hub_client.dart';
import 'package:el_hub_flutter/routes.dart';
import 'package:el_hub_flutter/src/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client(
    'http://10.0.2.2:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
  var sessionManager = SessionManager(
    caller: client.modules.auth,
  );

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await sessionManager.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      home: const SignInScreen(),
    );
  }
}

