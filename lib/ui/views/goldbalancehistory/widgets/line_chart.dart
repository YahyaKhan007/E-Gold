import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartDataModel {
  final String timePeriod;
  final double value;

  ChartDataModel({required this.timePeriod, required this.value});
}

class KLineChart extends StatelessWidget {
  final List<ChartDataModel> data;
  final double maxYValue;

  const KLineChart({super.key, required this.data, required this.maxYValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),

            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              )),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 28)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  interval: 1,
                  showTitles: true,
                  getTitlesWidget: (
                    double value,
                    TitleMeta meta,
                  ) {
                    var copyWith =
                        Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                            );

                    return SideTitleWidget(
                        space: 4,
                        axisSide: meta.axisSide,
                        child: Text(
                          data[value.toInt()].timePeriod,
                          style: copyWith,
                        ));
                  },
                ),
              ),
            ),

            minX: 0,
            maxX: data.length.toDouble() - 1,
            minY: 0,
            maxY: maxYValue, // Adjust according to your data range
            lineBarsData: [
              getLineBarData(
                  data, [Colors.amber, Colors.amber.shade500, Colors.white]),
            ],
          ),
        ),
      ),
    );
  }

  LineChartBarData getLineBarData(
      List<ChartDataModel> data, List<Color> colors) {
    return LineChartBarData(
        curveSmoothness: 0.32,
        spots: List.generate(
          data.length,
          (index) => FlSpot(index.toDouble(), data[index].value),
        ),
        isCurved: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: colors,
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            )),
        color: const Color(0xFF636363),
        barWidth: 2);
  }
}
