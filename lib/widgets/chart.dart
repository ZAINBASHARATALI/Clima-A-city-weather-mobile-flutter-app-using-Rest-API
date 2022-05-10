import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/models/10daydata.dart';
import 'package:weather_app/models/historydata.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget {
  Chart({
    required this.snapshot,
    Key? key,
  }) : super(key: key);
  AsyncSnapshot<TenDaysData?> snapshot;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: NumericAxis(
          axisLine: const AxisLine(
            color: Colors.white60,
            width: 0.7,
          ),
          interval: 1,
          labelStyle: const TextStyle(
            color: Colors.white70,
          ),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          placeLabelsNearAxisLine: true,
          interval: 10,
          maximum: 50,
          axisLine: const AxisLine(
            color: Colors.white60,
            width: 0.7,
          ),
          labelStyle: const TextStyle(
            color: Colors.white70,
          ),
        ),
        enableAxisAnimation: true,
        borderColor: const Color.fromARGB(255, 17, 38, 93),
        borderWidth: 2,
        plotAreaBackgroundColor: Colors.white10,
        title: ChartTitle(
            text: 'Temperature change in last 10 days',
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            )),
        backgroundColor: const Color.fromARGB(255, 4, 11, 58),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          color: Colors.white,
          textStyle: const TextStyle(color: Colors.black),
        ),
        series: <LineSeries<HistoryData, double>>[
          LineSeries<HistoryData, double>(
              dataSource: <HistoryData>[
                HistoryData(
                  dayindex: 1,
                  temp: snapshot.data!.list[0].main.temp,
                  color: Colors.redAccent,
                ),
                HistoryData(
                  dayindex: 2,
                  temp: snapshot.data!.list[1].main.temp,
                  color: Colors.blueAccent,
                ),
                HistoryData(
                  dayindex: 3,
                  temp: snapshot.data!.list[2].main.temp,
                  color: Colors.greenAccent,
                ),
                HistoryData(
                  dayindex: 4,
                  temp: snapshot.data!.list[3].main.temp,
                  color: Colors.orangeAccent,
                ),
                HistoryData(
                  dayindex: 5,
                  temp: snapshot.data!.list[4].main.temp,
                  color: Colors.purpleAccent,
                ),
                HistoryData(
                  dayindex: 6,
                  temp: snapshot.data!.list[5].main.temp,
                  color: Colors.cyanAccent,
                ),
                HistoryData(
                  dayindex: 7,
                  temp: snapshot.data!.list[6].main.temp,
                  color: Colors.pinkAccent,
                ),
                HistoryData(
                  dayindex: 8,
                  temp: snapshot.data!.list[7].main.temp,
                  color: Colors.redAccent,
                ),
                HistoryData(
                  dayindex: 9,
                  temp: snapshot.data!.list[8].main.temp,
                  color: Colors.yellowAccent,
                ),
                HistoryData(
                  dayindex: 10,
                  temp: snapshot.data!.list[9].main.temp,
                  color: Colors.redAccent,
                ),
              ],
              xValueMapper: (HistoryData mydata, _) => mydata.dayindex,
              yValueMapper: (HistoryData mydata, _) => mydata.temp,
              pointColorMapper: (HistoryData mydata, _) => mydata.color,
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  height: 2,
                  width: 2,
                  shape: DataMarkerType.diamond,
                  borderWidth: 4,
                  borderColor: Colors.red),
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ]);
  }
}
