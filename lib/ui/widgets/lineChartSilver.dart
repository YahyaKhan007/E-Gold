import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class KLineChart extends StatefulWidget {
  final List<Color>? gradientColors;
  final String lineChartHeading;

  const KLineChart(
      {super.key,
      required this.gradientColors,
      required this.lineChartHeading});

  @override
  State<KLineChart> createState() => _KLineChartState();
}

class _KLineChartState extends State<KLineChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 20,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.lineChartHeading,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: LineChart(
              mainData(),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, color: Colors.black26);
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, color: Colors.black26);
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 2:
        text = '30k';
        break;
      case 3:
        text = '50k';
        break;
      case 4:
        text = '75K';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        drawVerticalLine: false,
        drawHorizontalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1.6, 2),
            FlSpot(2.9, 5),
            FlSpot(3.8, 3.1),
            FlSpot(4, 4),
            FlSpot(5.5, 3),
            FlSpot(6.5, 6),
            FlSpot(7.5, 3),
            FlSpot(8.5, 7),
            FlSpot(9.5, 8),
            FlSpot(10.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: widget.gradientColors!,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: widget.gradientColors!
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
