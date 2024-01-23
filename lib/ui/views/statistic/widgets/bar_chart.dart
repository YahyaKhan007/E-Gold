import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IndividualBar {
  final int x;
  final List<double> y;

  IndividualBar(
    this.x,
    this.y,
  );
}

class BarData {
  final List<double> sunAmount;
  final List<double> monAmount;
  final List<double> tueAmount;
  final List<double> wedAmount;
  final List<double> thuAmount;
  final List<double> friAmount;
  final List<double> satAmount;

  BarData(this.sunAmount, this.monAmount, this.tueAmount, this.wedAmount,
      this.thuAmount, this.friAmount, this.satAmount);

  List<IndividualBar> weekData = [];

  void initializeBarData() {
    weekData = [
      IndividualBar(1, [sunAmount[0], sunAmount[1]]),
      IndividualBar(2, [monAmount[0], monAmount[1]]),
      IndividualBar(3, [tueAmount[0], tueAmount[1]]),
      IndividualBar(4, [wedAmount[0], wedAmount[1]]),
      IndividualBar(5, [thuAmount[0], thuAmount[1]]),
      IndividualBar(6, [friAmount[0], friAmount[1]]),
      IndividualBar(7, [satAmount[0], satAmount[1]]),
    ];
  }
}

class KBarChart extends StatelessWidget {
  final List<Map<String, dynamic>> weeklySummary;
  final double? maxYValue;
  final double? minYValue;

  const KBarChart(
      {super.key,
      required this.weeklySummary,
      required this.maxYValue,
      required this.minYValue});

  @override
  Widget build(BuildContext context) {
    BarData weeklyStatistics = BarData(
      [
        weeklySummary[0]['expanse'],
        weeklySummary[0]['income'],
      ],
      [
        weeklySummary[1]['expanse'],
        weeklySummary[1]['income'],
      ],
      [
        weeklySummary[2]['expanse'],
        weeklySummary[2]['income'],
      ],
      [
        weeklySummary[3]['expanse'],
        weeklySummary[3]['income'],
      ],
      [
        weeklySummary[4]['expanse'],
        weeklySummary[4]['income'],
      ],
      [
        weeklySummary[5]['expanse'],
        weeklySummary[5]['income'],
      ],
      [
        weeklySummary[6]['expanse'],
        weeklySummary[6]['income'],
      ],
    );

    weeklyStatistics.initializeBarData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxYValue,
                minY: minYValue,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: const FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: false,
                  )),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 40)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, getTitlesWidget: getBottomTitles)),
                ),
                barGroups: weeklyStatistics.weekData
                    .map((data) => BarChartGroupData(x: data.x, barRods: [
                          BarChartRodData(
                            color: Colors.amber[200],
                            toY: data.y[0],
                            width: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          BarChartRodData(
                            color: Colors.amber,
                            toY: data.y[1],
                            width: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ]))
                    .toList(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ListTile(
                  minLeadingWidth: 0,
                  leading: Icon(
                    Icons.square_rounded,
                    size: 16,
                    color: Colors.amber.shade200,
                  ),
                  title: const Text("Expanse"),
                ),
              ),
              const Expanded(
                child: ListTile(
                  minLeadingWidth: 0,
                  leading: Icon(
                    Icons.square_rounded,
                    size: 16,
                    color: Colors.amber,
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

Widget getBottomTitles(
  double value,
  TitleMeta meta,
) {
  var style = const TextStyle(
    fontWeight: FontWeight.w400,
  );

  Widget text;

  switch (value.toInt()) {
    case 1:
      text = Text("Sun", style: style);
      break;

    case 2:
      text = Text("Mon", style: style);
      break;

    case 3:
      text = Text("Tue", style: style);
      break;

    case 4:
      text = Text("Wed", style: style);
      break;

    case 5:
      text = Text("Thu", style: style);
      break;
    case 6:
      text = Text("Fri", style: style);
      break;

    case 7:
      text = Text("Sat", style: style);
      break;

    default:
      text = Text("", style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
