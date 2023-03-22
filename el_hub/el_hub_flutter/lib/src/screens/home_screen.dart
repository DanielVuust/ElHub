import 'package:el_hub_client/el_hub_client.dart';
import 'package:el_hub_flutter/bloc/power_installations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../widgets/home/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PowerInstallationsBloc>(context)
        .eventSink
        .add(PowerInstallationsEventLoad());
        
    return Scaffold(
        appBar: AppBar(title: const Text("El Hub")),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const HomeHeaderWidget(),
          ]),
        ));
  }
}
