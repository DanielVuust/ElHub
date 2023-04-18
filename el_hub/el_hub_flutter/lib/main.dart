import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:el_hub_client/el_hub_client.dart';
import 'package:el_hub_flutter/routes.dart';
import 'package:el_hub_flutter/src/screens/home_screen.dart';
import 'package:el_hub_flutter/src/screens/sign_in_screen.dart';
import 'package:el_hub_flutter/src/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import '../utility/logging/logger.dart';

import 'bloc/power_installations_bloc.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client(
  'http://10.0.2.2:8079/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();
var sessionManager = SessionManager(
  caller: client.modules.auth,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await sessionManager.initialize();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<PowerInstallationsBloc>(
      create: (context) => PowerInstallationsBloc(),
    ),
  ], child: MyWidget()));
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});
  late bool isUserLoggedIn = sessionManager.isSignedIn;
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'El Hub Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: appRoutes,
        home: Builder(
          builder: (BuildContext context) {
            if (sessionManager.isSignedIn) {
              return MyApps();
            }
            return const SignInScreen();
          },
        )
      );
  }

  void initState() {
    super.initState();
    sessionManager.addListener(() {
      setState(() {
        widget.isUserLoggedIn = sessionManager.isSignedIn;
      });
    });
  }
}

class MyApps extends StatefulWidget {
  MyApps({Key? key}) : super(key: key);

  int selectedpage = 1;
  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: const [
          TabItem(
            icon: Icons.person,
          ),
          TabItem(
            icon: Icons.house,
          ),
        ],
        initialActiveIndex: 1,
        onTap: (int i) {
          setState(() {
            widget.selectedpage = i;
          });
        },
      ),
      body: IndexedStack(
        index: widget.selectedpage,
        children: const [UserScreen(), HomeScreen()],
      ),
    );
  }
}
