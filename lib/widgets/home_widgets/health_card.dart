import 'package:fl_chart/fl_chart.dart';

import '../../constants/exports.dart';

class HeartRateSectionWithFilter extends StatefulWidget {
  const HeartRateSectionWithFilter({super.key});

  @override
  _HeartRateSectionWithFilterState createState() => _HeartRateSectionWithFilterState();
}

class _HeartRateSectionWithFilterState extends State<HeartRateSectionWithFilter> {
  String selectedTimePeriod = 'Today';
  List<String> timePeriods = ['Today', 'Last Week', 'Last Month'];

  // Sample data for different time periods
  final Map<String, List<double>> heartRateData = {
    'Today': [72, 75, 80, 78, 76, 74, 72],
    'Last Week': [70, 72, 75, 77, 76, 74, 73],
    'Last Month': [68, 70, 72, 75, 74, 73, 72],
  };

  // Average BPM for each period
  final Map<String, int> averageBpm = {
    'Today': 72,
    'Last Week': 73,
    'Last Month': 72,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              AppStrings.healthAnalytics,
              fontSize: 18,
            ),
          ],
        ),
        15.verticalSpace,
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divColor),
            color: AppColors.divColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const TextWidget(
                    AppStrings.heartRate,
                  ),
                  const Spacer(),
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.divColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: DropdownButton<String>(
                        value: selectedTimePeriod,
                        icon: Assets.icons.dropdownIcon.svg(),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: AppColors.secFontColor),
                        underline: Container(height: 0),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTimePeriod = newValue!;
                          });
                        },
                        items: timePeriods.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  5.horizontalSpace,
                  TextWidget(
                    '${averageBpm[selectedTimePeriod]} ${AppStrings.bpm}',
                    fontWeight: FontWeight.bold,
                    // color: Colors.blue[800],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 150.h,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData:const FlTitlesData(show: false),
                    borderData:  FlBorderData(show: false),
                    minX: 0,
                    maxX: heartRateData[selectedTimePeriod]!.length.toDouble() - 1,
                    minY: 60,
                    maxY: 90,
                    lineBarsData: [
                      LineChartBarData(
                        spots: heartRateData[selectedTimePeriod]!.asMap().entries.map((entry) {
                          return FlSpot(entry.key.toDouble(), entry.value);
                        }).toList(),
                        isCurved: true,
                        color: AppColors.primary,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData:const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          // show: true,
                            color: AppColors.cardColor
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}