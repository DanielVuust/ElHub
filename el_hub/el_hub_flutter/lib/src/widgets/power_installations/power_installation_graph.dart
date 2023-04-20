import 'dart:async';
import 'dart:math';

import 'package:el_hub_client/el_hub_client.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utility/classes/chart_sample_data.dart';

class PowerInstallationGraph extends StatelessWidget {
  final List<DomainChartData> chartData;
  PowerInstallationGraph({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        enableAxisAnimation: true,
        // Initialize category axis
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          // Initialize line series
          LineSeries<DomainChartData, String>(
              dataSource: chartData,
              xValueMapper: (DomainChartData data, _) =>
                  DateFormat.Hms().format(data.x),
              yValueMapper: (DomainChartData data, _) => data.y)
        ]);
  }
}
