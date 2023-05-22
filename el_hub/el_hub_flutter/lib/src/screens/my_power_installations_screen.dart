import 'package:el_hub_flutter/bloc/power_installations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/power_installations/my_power_installations/my_power_installations_list.dart';


class MyPowerInstallationsScreen extends StatefulWidget {
  const MyPowerInstallationsScreen({super.key});

  @override
  State<MyPowerInstallationsScreen> createState() =>
      _MyPowerInstallationsScreenState();
}

class _MyPowerInstallationsScreenState
    extends State<MyPowerInstallationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mine installationer")),
      body: const Center(
          child: MyPowerInstallationsList(),
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    //We force a update of power installations when we enter this screen, in case any db records has been changed externally.
    BlocProvider.of<PowerInstallationsBloc>(context)
        .eventSink
        .add(PowerInstallationsLoadEvent());
  }
}
