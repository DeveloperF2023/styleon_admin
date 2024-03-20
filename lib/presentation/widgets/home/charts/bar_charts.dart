import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/products_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'header_chart.dart';

class ApiChart extends StatefulWidget {
  final List<ProductModel> productModel;

  ApiChart({required this.productModel});

  @override
  _ApiChartState createState() => _ApiChartState();
}

class _ApiChartState extends State<ApiChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height10, bottom: height10),
      child: Column(
        children: [
          const HeaderOfChart(),
          sizeVertical(height20),
          Expanded(
            child: BarChart(
              BarChartData(
                gridData: FlGridData(show: true),
                maxY: 15000,
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value, index) => const TextStyle(
                      color: Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    margin: 10,
                  ),
                  topTitles: SideTitles(showTitles: false),
                  rightTitles: SideTitles(showTitles: false),
                ),
                borderData: FlBorderData(
                  show: false,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
                barGroups: widget.productModel
                    .asMap()
                    .entries
                    .map((entry) => BarChartGroupData(
                          x: entry.key.toInt(),
                          barRods: [
                            BarChartRodData(
                                y: entry.value.productPrice!.toDouble(),
                                colors: [const Color(0xff7b4af5)],
                                width: 8,
                                borderRadius: BorderRadius.circular(3),
                                backDrawRodData: BackgroundBarChartRodData(
                                  show: true,
                                ),
                                borderSide: BorderSide(
                                    color: AppColors.subtitleColor!, width: 1)),
                          ],
                        ))
                    .toList(),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
