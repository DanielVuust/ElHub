import 'package:el_hub_flutter/src/widgets/power_installations/power_installation_graph.dart';
import 'package:el_hub_flutter/src/widgets/power_installations/power_installation_graph_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/power_installations_bloc.dart';
import '../../../utility/classes/chart_sample_data.dart';

class PowerInstallationGraphStreamBuilder extends StatelessWidget {
  const PowerInstallationGraphStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: StreamBuilder<PowerInstallationsState>(
          stream: BlocProvider.of<PowerInstallationsBloc>(context)
              .powerInstallationStateStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return const Text('done');
            } else if (snapshot.hasError) {
              return const Text('Error!');
            } else if (snapshot.data == null) {
              return const Text('No Data');
            } else {
              if(snapshot.data?.powerInstallations.length == 0) {
                return Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Text('Du er ikke tilnkyttet nogen installationer. \nTilføj en ny installation under din profil for at komme i gang.'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data?.powerInstallations.length ?? 0,
                itemBuilder: (context, index) {
                  return PowerInstallationGraphSection(
                    powerInstallation: snapshot.data!.powerInstallations[index],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
