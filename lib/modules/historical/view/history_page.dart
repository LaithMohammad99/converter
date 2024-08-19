import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:taske_bloc_converte/core/model/historcal_model.dart';

class HistoricalView extends StatelessWidget {
  const HistoricalView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ExchangeRateModel> usdToJod = StaticExchangeRates.usdToJod;
    final List<ExchangeRateModel> jodToUsd = StaticExchangeRates.jodToUsd;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historical Exchange Rates',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          final date = usdToJod[value.toInt()].date;
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              date,
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 0.5,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              value.toString(),
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: usdToJod.length.toDouble() - 1,
                  minY: 0,
                  maxY: 1.5,
                  lineBarsData: [
                    LineChartBarData(
                      spots: usdToJod
                          .asMap()
                          .entries
                          .map((entry) => FlSpot(entry.key.toDouble(), entry.value.rate))
                          .toList(),
                      isCurved: true,
                      color: Colors.teal,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: jodToUsd
                          .asMap()
                          .entries
                          .map((entry) => FlSpot(entry.key.toDouble(), entry.value.rate))
                          .toList(),
                      isCurved: true,
                      color: Colors.red,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



