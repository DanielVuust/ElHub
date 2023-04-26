import 'package:el_hub_client/el_hub_client.dart';
import 'package:el_hub_flutter/src/widgets/power_installations/power_installation_details/power_installation_details_form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../main.dart';

class PowerInstallationDetails extends StatelessWidget {
  late PowerInstallation powerInstallation;
  
  PowerInstallationDetails({super.key, powerInstallation})  {
    this.powerInstallation = powerInstallation ?? PowerInstallation(name: "", type: "", componentId: "",);
  }
  
  @override
  Widget build(BuildContext context) {
    return PowerInstallationDetailsForm(powerInstallation: powerInstallation);
  }
}