import 'package:el_hub_flutter/bloc/power_installations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
      body: Center(
          child: StreamBuilder<PowerInstallationsState>(
          stream: BlocProvider.of<PowerInstallationsBloc>(context).powerInstallationStateStream,
          builder: (context, AsyncSnapshot<PowerInstallationsState> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return const Text('done');
            } else if (snapshot.hasError) {
              return const Text('Error!');
            } else if (snapshot.data == null) {
              return const Text('No Data');
            } else {
              return Placeholder();
            }
          },
        ),
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    //We force a update of power installations when we enter this screen, in case any db records has been changed externally.
    BlocProvider.of<PowerInstallationsBloc>(context)
        .eventSink
        .add(PowerInstallationsEventLoad());
  }
}
