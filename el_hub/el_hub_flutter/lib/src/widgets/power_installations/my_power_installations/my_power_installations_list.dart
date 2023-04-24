import 'package:el_hub_flutter/src/widgets/power_installations/my_power_installations/my_power_installation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/power_installations_bloc.dart';

class MyPowerInstallationsList extends StatelessWidget {
  const MyPowerInstallationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PowerInstallationsState>(
      stream: BlocProvider.of<PowerInstallationsBloc>(context)
          .powerInstallationStateStream,
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
          return Container(
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(236, 236, 236, 1)
                ),
            child: ListView.builder(
                  itemCount: snapshot.data?.powerInstallations.length ?? 0,
                  itemBuilder: (context, index) {
                    return MyPowerInstallationsItem(
                      powerInstallation: snapshot.data!.powerInstallations[index],
                    );
                  },
                ),
          );
        }
      },
    );
  }
}
