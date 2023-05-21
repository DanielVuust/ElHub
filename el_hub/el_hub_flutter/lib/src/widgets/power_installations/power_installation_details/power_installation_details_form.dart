import 'package:el_hub_client/el_hub_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/power_installations_bloc.dart';

class PowerInstallationDetailsForm extends StatelessWidget {
  final PowerInstallation powerInstallation;

  PowerInstallationDetailsForm({super.key, required this.powerInstallation});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(236, 236, 236, 1)
                ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              initialValue: powerInstallation.name,
              decoration: const InputDecoration(
                labelText: 'Navn',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Indtast venligst et navn';
                }
                return null;
              },
              onSaved: (newValue) => powerInstallation.name = newValue!,
            ),
            TextFormField(
              initialValue: powerInstallation.type,
              decoration: const InputDecoration(
                labelText: 'Type',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Indtast venligst en type';
                }
                return null;
              },
              onSaved: (newValue) => powerInstallation.type = newValue!,
            ),
            TextFormField(
              initialValue: powerInstallation.componentId.toString(),
              decoration: const InputDecoration(
                labelText: 'Komponent id',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Indtast venligst et til et komponent id';
                }
                return null;
              },
              onSaved: (newValue) => powerInstallation.componentId = newValue!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      _formKey.currentState?.save();
                      BlocProvider.of<PowerInstallationsBloc>(context).eventSink.add(
                          UpdatePowerInstallationDetailsEvent(powerInstallation));
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    child: const Text('Gem'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<PowerInstallationsBloc>(context).eventSink.add(
                        DeletePowerInstallationDetailsEvent(powerInstallation));
                    Navigator.pop(context);
                    
                  },
                  child: Container(
                    child: const Text('Slet'),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
