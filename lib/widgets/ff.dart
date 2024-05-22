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
          child: BarChart(
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
                        child: Text(value.toInt().toString(), style: TextStyle(color: Colors.black, fontSize: 14)),
                        axisSide: meta.axisSide,
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
                          return SideTitleWidget(child: Text('A', style: style), axisSide: meta.axisSide);
                        case 1:
                          return SideTitleWidget(child: Text('B', style: style), axisSide: meta.axisSide);
                        case 2:
                          return SideTitleWidget(child: Text('C', style: style), axisSide: meta.axisSide);
                        case 3:
                          return SideTitleWidget(child: Text('D', style: style), axisSide: meta.axisSide);
                        case 4:
                          return SideTitleWidget(child: Text('E', style: style), axisSide: meta.axisSide);
                        case 5:
                          return SideTitleWidget(child: Text('F', style: style), axisSide: meta.axisSide);
                        case 6:
                          return SideTitleWidget(child: Text('G', style: style), axisSide: meta.axisSide);
                        case 7:
                          return SideTitleWidget(child: Text('H', style: style), axisSide: meta.axisSide);
                        case 8:
                          return SideTitleWidget(child: Text('I', style: style), axisSide: meta.axisSide);
                        case 9:
                          return SideTitleWidget(child: Text('J', style: style), axisSide: meta.axisSide);
                        case 10:
                          return SideTitleWidget(child: Text('K', style: style), axisSide: meta.axisSide);
                        case 11:
                          return SideTitleWidget(child: Text('L', style: style), axisSide: meta.axisSide);
                        default:
                          return SideTitleWidget(child: Text('', style: style), axisSide: meta.axisSide);
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
          ),
        ),
      ),
    );
  }
}