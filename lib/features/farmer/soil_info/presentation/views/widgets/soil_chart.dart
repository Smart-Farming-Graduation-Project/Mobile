import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/farmer/soil_info/domain/entities/soil_chart_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoilChart extends StatelessWidget {
  const SoilChart({
    super.key,
    required this.soilChart,
  });

  final List<SoilChartEntity> soilChart;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30.h,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final days = [
                    soilChart[6].day,
                    soilChart[5].day,
                    soilChart[4].day,
                    soilChart[3].day,
                    soilChart[2].day,
                    soilChart[1].day,
                    soilChart[0].day,
                  ];
                  if (value >= 0 && value < days.length && value % 1 == 0) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(days[value.toInt()],
                          style: AppTextStyles.font12BlackBold),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, soilChart[6].healthPercentage),
                FlSpot(1, soilChart[5].healthPercentage),
                FlSpot(2, soilChart[4].healthPercentage),
                FlSpot(3, soilChart[3].healthPercentage),
                FlSpot(4, soilChart[2].healthPercentage),
                FlSpot(5, soilChart[1].healthPercentage),
                FlSpot(6, soilChart[0].healthPercentage),
              ],
              isCurved: true,
              color: AppColors.kPrimaryColor,
              barWidth: 3,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
