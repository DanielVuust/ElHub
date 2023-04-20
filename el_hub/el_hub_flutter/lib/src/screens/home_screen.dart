import 'dart:async';

import 'package:el_hub_client/el_hub_client.dart';
import 'package:el_hub_flutter/bloc/power_installations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../widgets/home/home_header.dart';
import '../widgets/power_installations/power_installation_graph.dart';
import '../widgets/power_installations/power_installation_graph_stream_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer updatePowerReadsEventTimer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("El Hub")),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                HomeHeaderWidget(),
                PowerInstallationGraphStreamBuilder(),
              ]),
        ));
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<PowerInstallationsBloc>(context)
        .eventSink
        .add(PowerInstallationsEventLoad());

    updatePowerReadsEventTimer =
        Timer.periodic(const Duration(seconds: 5), (timer) {
      BlocProvider.of<PowerInstallationsBloc>(context)
          .eventSink
          .add(UpdatePowerReadsEvent());
    });
  }

  @override
  void dispose() {
    updatePowerReadsEventTimer.cancel();
    super.dispose();
  }
}
