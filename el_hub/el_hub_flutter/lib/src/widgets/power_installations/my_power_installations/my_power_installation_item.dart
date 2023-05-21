import 'package:el_hub_client/el_hub_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyPowerInstallationsItem extends StatelessWidget {
  final PowerInstallation powerInstallation;
  const MyPowerInstallationsItem({super.key, required this.powerInstallation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => 
        Navigator.pushNamed(context, '/powerInstallationDetails',
            arguments: powerInstallation),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(23, 176, 245, 1,),
                    boxShadow: const  [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
      ),
        child: Column(
          children: [
            Text(powerInstallation.name),
            Text(powerInstallation.componentId.toString()),
          ],
        ),
      ),
    );
  }
}
