import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/power_installations_bloc.dart';

class AddNewPowerInstallationNavigationButton extends StatelessWidget {
  const AddNewPowerInstallationNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromRGBO(209, 209, 209, 1)),
        ),
        onPressed: () => {
          Navigator.pushNamed(context, '/powerInstallationDetails', arguments: null),
        },
        child: Row(
          children: const [
            Icon(Icons.add),
            Text(
              "Tilføj ny installation",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
