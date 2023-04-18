import 'package:el_hub_client/el_hub_client.dart';
import 'package:el_hub_flutter/src/widgets/user/buttons/log_out_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/power_installations_bloc.dart';
import '../../main.dart';
import '../widgets/user/buttons/add_new_power_installation_navigation_button.dart';
import '../widgets/user/buttons/my_power_installations_navigation_button.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("El Hub")),
      body: Center(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(236, 236, 236, 1)
                ),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                  Text("Mine installationer", style: const TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  
                  MyPowerInstallationsNavigationButton(),
                  SizedBox(height: 10),

                  AddNewPowerInstallationNavigationButton(),
                ],)
              ),
               Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(236, 236, 236, 1)
                ),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Profil", style: const TextStyle(fontSize: 20)),
                  LogOutButton(),
                ],)
              ),
              
              
            ],),
      ),
    );
  }
}
