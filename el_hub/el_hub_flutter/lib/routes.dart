
import 'package:el_hub_flutter/src/screens/home_screen.dart';
import 'package:el_hub_flutter/src/screens/my_power_installations_screen.dart';
import 'package:el_hub_flutter/src/screens/power_installation_details_screen.dart';
import 'package:el_hub_flutter/src/screens/sign_in_screen.dart';

var appRoutes = {
  '/signIn': (context) => const SignInScreen(),
  '/home': (context) => const HomeScreen(),
  '/myPowerInstallations': (context) => const MyPowerInstallationsScreen(),
  '/powerInstallationDetails': (context) => PowerInstallationDetailsScreen(),
};