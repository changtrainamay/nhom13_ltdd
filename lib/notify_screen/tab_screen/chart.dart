import 'dart:math';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter/material.dart';

@override
Widget chartA(BuildContext context) {
  final List<ChartData> lineA = [
    ChartData(2010, 0),
    ChartData(2011, 75000),
    ChartData(2012, 0),
    ChartData(2013, 1),
    ChartData(2014, 1)
  ];
  final List<ChartData> lineB = [
    ChartData(2010, 0),
    ChartData(2011, 70000),
    ChartData(2012, 0),
    ChartData(2013, 50000),
    ChartData(2014, 0)
  ];
  return Scaffold(
    body: Center(
      child: Container(
        child: SfCartesianChart(
          title: ChartTitle(textStyle: TextStyle(color: Colors.black)),
          backgroundColor: Colors.black,
          series: <ChartSeries>[
            // Renders spline chart
            SplineSeries<ChartData, int>(
                
                color: Colors.green,
                width: 3,
                dataSource: lineA,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y),
            SplineSeries<ChartData, int>(
                color: Colors.yellow,
                dashArray: <double>[15, 10],
                width: 3,
                dataSource: lineB,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y),
          ],
        ),
      ),
    ),
  );
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}
