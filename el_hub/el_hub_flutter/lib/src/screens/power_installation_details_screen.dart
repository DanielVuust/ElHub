import 'package:el_hub_client/el_hub_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/power_installations/power_installation_details/power_installation_details.dart';

class PowerInstallationDetailsScreen extends StatelessWidget {
  PowerInstallationDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final PowerInstallation? args = ModalRoute.of(context)!.settings.arguments as PowerInstallation?;
    return Scaffold(
      appBar: AppBar(title: const Text("Power installation detaljer")),
      body: Center(
        child: PowerInstallationDetails(powerInstallation: args,),
      ),
    );
  }
}
