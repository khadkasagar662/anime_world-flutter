import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/sales.dart';

class CategoryProducts extends StatelessWidget {
  final List<Sales> salesData;

  const CategoryProducts({Key? key, required this.salesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        groupsSpace: 12,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) => const TextStyle(fontSize: 10),
            margin: 8,
            getTitles: (double value) {
              int index = value.toInt();
              if (index >= 0 && index < salesData.length) {
                return salesData[index].label;
              }
              return '';
            },
          ),
          leftTitles: SideTitles(showTitles: true),
        ),
        borderData: FlBorderData(show: false),
        barGroups: salesData.asMap().entries.map((entry) {
          int index = entry.key;
          Sales sale = entry.value;
          return BarChartGroupData(
            x: index,
            barRods: [BarChartRodData(y: sale.earning)],
            showingTooltipIndicators: [0],
          );
        }).toList(),
      ),
    );
  }
}
