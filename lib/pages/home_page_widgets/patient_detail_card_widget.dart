import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PatientDetailCardWidget extends StatefulWidget {
  final String name;
  final String id;
  final String roomNo;
  final String heartRate;
  final String spo2;
  final String bp;
  final String temp;
  final String status;
  final String battery;

  const PatientDetailCardWidget({
    super.key,
    required this.name,
    required this.id,
    required this.roomNo,
    required this.heartRate,
    required this.spo2,
    required this.bp,
    required this.temp,
    required this.status,
    required this.battery,
  });

  @override
  State<PatientDetailCardWidget> createState() =>
      _PatientDetailCardWidgetState();
}

class _PatientDetailCardWidgetState extends State<PatientDetailCardWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF22232B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFFF3D3D).withValues(alpha: 0.6),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 164,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left Column
                Container(
                  width: 220,
                  padding: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Id: ${widget.id}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'R.No: ${widget.roomNo}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Metrics
                Expanded(
                  child: _buildMetricCard(
                    title: 'Heart Rate',
                    value: widget.heartRate,
                    unit: 'bpm',
                    icon: Icons.monitor_heart_outlined,
                    iconBgColor: const Color(0xFF2ECA71),
                    chartType: 'line_ekg',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    title: 'SpO2',
                    value: widget.spo2.replaceAll('%', ''),
                    unit: '%',
                    icon: Icons.air,
                    iconBgColor: const Color(0xFF8B5CF6),
                    chartType: 'gauge',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    title: 'BP Trend',
                    value: widget.bp,
                    unit: 'mmHg',
                    icon: Icons.trending_up,
                    iconBgColor: const Color(0xFFEC4899),
                    chartType: 'bar',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    title: 'Temp',
                    value: widget.temp,
                    unit: '°C',
                    icon: Icons.thermostat_outlined,
                    iconBgColor: const Color(0xFF3B82F6),
                    chartType: 'line_curve',
                  ),
                ),
                const SizedBox(width: 20),
                // Right Status Column
                Container(
                  width: 220,
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 8,
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Status',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            widget.status,
                            style: TextStyle(
                              color: widget.status.toLowerCase() == 'stable'
                                  ? const Color(0xFF44D17A)
                                  : const Color(0xFFFF5A5A),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text(
                            'Battery',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.battery_full,
                                  color: Color(0xFF44D17A),
                                  size: 14,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  widget.battery,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Arrow button
                      Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(
                            _isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white54,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: !_isExpanded
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      const SizedBox(height: 20),
                      Divider(
                        color: Colors.white.withValues(alpha: 0.1),
                        thickness: 1,
                      ),
                      const SizedBox(height: 20),
                      // Bottom row
                      Row(
                        children: [
                          Container(
                            height: 52,
                            width: 220,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC79A54),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Flag Doctor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: _buildBadge(
                                    'NEWS2',
                                    'Score 10',
                                    const Color(0xFFFF5A5A),
                                    Icons.show_chart,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildBadge(
                                    'AF Warning',
                                    'Normal',
                                    const Color(0xFF44D17A),
                                    Icons.bolt,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildBadge(
                                    'Stroke Risk',
                                    'High',
                                    const Color(0xFFFF5A5A),
                                    Icons.psychology,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildBadge(
                                    'Seizure Risk',
                                    'High',
                                    const Color(0xFFFF5A5A),
                                    Icons.face_retouching_natural,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: 52,
                            width: 220,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.2),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Take Action',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color iconBgColor,
    required String chartType,
  }) {
    // Generate some mock chart widgets based on type
    Widget? chartWidget;
    if (chartType == 'line_ekg') {
      chartWidget = LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineTouchData: const LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3),
                FlSpot(1, 4),
                FlSpot(1.5, 2),
                FlSpot(2, 6),
                FlSpot(2.5, 3),
                FlSpot(3, 3.5),
                FlSpot(4, 2),
                FlSpot(4.5, 5),
                FlSpot(5, 3),
                FlSpot(6, 4),
                FlSpot(6.5, 2),
                FlSpot(7, 4.5),
                FlSpot(8, 2.5),
                FlSpot(9, 3),
              ],
              isCurved: false,
              color: const Color(0xFFC79A54),
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      );
    } else if (chartType == 'bar') {
      chartWidget = BarChart(
        BarChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          barTouchData: BarTouchData(enabled: false),
          barGroups: List.generate(20, (index) {
            double h = (index % 3 == 0)
                ? 6
                : (index % 2 == 0)
                ? 4
                : 2;
            if (index == 5 || index == 12 || index == 18) h = 8;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: h,
                  color: const Color(0xFFC79A54).withValues(alpha: 0.8),
                  width: 4,
                  borderRadius: BorderRadius.circular(2),
                ),
              ],
            );
          }),
        ),
      );
    } else if (chartType == 'line_curve') {
      chartWidget = LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineTouchData: const LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 1),
                FlSpot(1, 2),
                FlSpot(3, 4),
                FlSpot(5, 1.5),
                FlSpot(7, 2.5),
                FlSpot(9, 3),
              ],
              isCurved: true,
              color: const Color(0xFFC79A54),
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFC79A54).withValues(alpha: 0.3),
                    const Color(0xFFC79A54).withValues(alpha: 0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (chartType == 'gauge') {
      double parseVal = double.tryParse(value) ?? 85.0;
      chartWidget = Transform.scale(
        scale: 1.25,
        alignment: Alignment.topCenter,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              canScaleToFit: true,
              startAngle: 180,
              endAngle: 0,
              showLabels: false,
              showTicks: true,
              majorTickStyle: const MajorTickStyle(
                length: 6,
                thickness: 1.5,
                color: Color(0xFFC79A54),
              ),
              minorTicksPerInterval: 0,
              axisLineStyle: AxisLineStyle(
                thickness: 3,
                color: const Color(0xFFC79A54).withValues(alpha: 0.3),
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: parseVal,
                  width: 3,
                  color: const Color(0xFFC79A54),
                ),
                NeedlePointer(
                  value: parseVal,
                  needleLength: 0.8,
                  needleColor: const Color(0xFFC79A54),
                  needleStartWidth: 0,
                  needleEndWidth: 4,
                  knobStyle: const KnobStyle(knobRadius: 0),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2B33),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  unit,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (chartWidget != null)
            SizedBox(
              height: 36,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: chartWidget,
              ),
            )
          else
            Container(
              height: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    iconBgColor.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBadge(String title, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    color: color,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Icon(icon, color: color.withValues(alpha: 0.7), size: 24),
        ],
      ),
    );
  }
}
