import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseIncomeModel {
  final String dataOf;
  final double expenses;
  final double income;

  ExpenseIncomeModel({
    required this.dataOf,
    required this.expenses,
    required this.income,
  });
}

class KBarChart extends StatefulWidget {
  final List<ExpenseIncomeModel> data;

  final double? maxYValue;
  final double? minYValue;

  const KBarChart(
      {super.key,
      required this.data,
      required this.maxYValue,
      required this.minYValue});

  @override
  State<KBarChart> createState() => _KBarChartState();
}

class _KBarChartState extends State<KBarChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: ScrollController(),
          child: SizedBox(
            width: widget.data.length == 7
                ? screenWidth(context) * .9
                : widget.data.length <= 28 || widget.data.length <= 30
                    ? 800
                    : 640,
            height: 244,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: widget.maxYValue,
                minY: widget.minYValue,
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
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 36)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (
                        double value,
                        TitleMeta meta,
                      ) {
                        return SideTitleWidget(
                            space: 4,
                            axisSide: meta.axisSide,
                            child: Text(
                              widget.data[value.toInt()].dataOf,
                            ));
                      },
                    ),
                  ),
                ),
                barGroups: widget.data
                    .asMap()
                    .entries
                    .map(
                      (entry) => BarChartGroupData(
                        x: entry.key,
                        barRods: [
                          BarChartRodData(
                            width: 6,
                            toY: entry.value.expenses,
                            color: kcLightButtonBackground,
                          ),
                          BarChartRodData(
                            width: 6,
                            toY: entry.value.income,
                            color: kcButtonBackground,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  minLeadingWidth: 0,
                  leading: Icon(
                    Icons.square_rounded,
                    size: 16,
                    color: kcLightButtonBackground,
                  ),
                  title: Text("Expanse"),
                ),
              ),
              Expanded(
                child: ListTile(
                  minLeadingWidth: 0,
                  leading: Icon(
                    Icons.square_rounded,
                    size: 16,
                    color: kcButtonBackground,
                  ),
                  title: Text("Income"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
