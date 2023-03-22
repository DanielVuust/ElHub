import 'package:el_hub_client/el_hub_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/power_installations_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("El Hub")),
      body: Center(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              ElevatedButton(onPressed: () => {
                BlocProvider.of<PowerInstallationsBloc>(context)
                }, 
              child: const Placeholder())
            ]),
      ),
    );
  }
}
