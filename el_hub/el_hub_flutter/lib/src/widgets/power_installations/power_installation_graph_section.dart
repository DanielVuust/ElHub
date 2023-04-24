import 'package:el_hub_client/el_hub_client.dart';
import 'package:el_hub_flutter/src/widgets/power_installations/power_installation_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../utility/classes/chart_sample_data.dart';

class PowerInstallationGraphSection extends StatelessWidget {
  final PowerInstallation powerInstallation;
  PowerInstallationGraphSection({super.key, required this.powerInstallation});
  List<DomainChartData> chartData2 = <DomainChartData>[
    DomainChartData(DateTime.now(), 30),
  ];
  @override
  Widget build(BuildContext context) {
    List<DomainChartData> chartData3 = [];
    chartData3 = powerInstallation.powerReadIntervals!
        .map((e) => DomainChartData(
            e.powerReadIntervalStart,
            _convertKwToKwh(e.powerReadIntervalStart, e.powerReadIntervalEnd,
                e.powerInKilowatts.toDouble())))
        .toList();

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(236, 236, 236, 1)
                ),
      child: Column(
        children: [
        Text(
          powerInstallation.name,
        ),
        PowerInstallationGraph(chartData: chartData3),
      ]),
    );
  }

  double _convertKwToKwh(DateTime start, DateTime end, double kw) {
    return kw *
        (end.difference(start).inMilliseconds / 1000 / 60 / 60).toDouble();
  }
}
