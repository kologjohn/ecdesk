import 'package:ecdesk/database/databases.dart';
import 'package:firedart/firestore/models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          //width: 600,
          child: FutureBuilder(
            future: FirebaseAccounts().ecdata(), builder: (BuildContext context, AsyncSnapshot<List<Document>> snapshot) {

              if(snapshot.hasData)
                {
                  print(snapshot.data!.length);
                }
              else
                {
                  print("No Data");
                }
              return BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(value.toInt().toString(), style: const TextStyle(color: Colors.black, fontSize: 14)),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          );
                          switch (value.toInt()) {
                            case 0:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('A', style: style));
                            case 1:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('B', style: style));
                            case 2:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('C', style: style));
                            case 3:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('D', style: style));
                            case 4:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('E', style: style));
                            case 5:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('F', style: style));
                            case 6:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('G', style: style));
                            case 7:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('H', style: style));
                            case 8:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('I', style: style));
                            case 9:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('J', style: style));
                            case 10:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('K', style: style));
                            case 11:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('L', style: style));
                            default:
                              return SideTitleWidget(axisSide: meta.axisSide, child: const Text('', style: style));
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(toY: 18, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(toY: 20, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(toY: 1, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(toY: 17, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(toY: 13, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [
                        BarChartRodData(toY: 10, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 6,
                      barRods: [
                        BarChartRodData(toY: 7, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 7,
                      barRods: [
                        BarChartRodData(toY: 8, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 8,
                      barRods: [
                        BarChartRodData(toY: 6, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 9,
                      barRods: [
                        BarChartRodData(toY: 5, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 10,
                      barRods: [
                        BarChartRodData(toY: 9, color: Colors.green[900])
                      ],
                    ),
                    BarChartGroupData(
                      x: 11,
                      barRods: [
                        BarChartRodData(toY: 11, color: Colors.green[900])
                      ],
                    ),
                  ],
                ),
              );
          },
          ),
        ),
      ),
    );
  }
}