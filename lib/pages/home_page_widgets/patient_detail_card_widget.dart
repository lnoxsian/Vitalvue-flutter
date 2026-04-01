import 'package:flutter/material.dart';

class PatientDetailCardWidget extends StatelessWidget {
  final String name;
  final String id;
  final String roomNo;
  final String heartRate;
  final String spo2;
  final String bp;
  final String temp;

  const PatientDetailCardWidget({
    super.key,
    required this.name,
    required this.id,
    required this.roomNo,
    required this.heartRate,
    required this.spo2,
    required this.bp,
    required this.temp,
  });

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
          IntrinsicHeight(
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
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Id: $id',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'R.No: $roomNo',
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
                    value: heartRate,
                    unit: 'bpm',
                    icon: Icons.monitor_heart_outlined,
                    iconBgColor: const Color(0xFF2ECA71),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    title: 'SpO2',
                    value: spo2.replaceAll('%', ''),
                    unit: '%',
                    icon: Icons.air,
                    iconBgColor: const Color(0xFF8B5CF6),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    title: 'BP Trend',
                    value: bp,
                    unit: 'mmHg',
                    icon: Icons.show_chart,
                    iconBgColor: const Color(0xFFEC4899),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    title: 'Temp',
                    value: temp,
                    unit: '°C',
                    icon: Icons.thermostat_outlined,
                    iconBgColor: const Color(0xFF3B82F6),
                  ),
                ),
                const SizedBox(width: 20),
                // Right Status Column
                Container(
                  width: 220,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
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
                        children: const [
                          Text(
                            'Status',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Disconnected',
                            style: TextStyle(
                              color: Color(0xFFFF5A5A),
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
                              children: const [
                                Icon(
                                  Icons.battery_full,
                                  color: Color(0xFF44D17A),
                                  size: 14,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '80%',
                                  style: TextStyle(
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
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white54,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.white.withValues(alpha: 0.1), thickness: 1),
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
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color iconBgColor,
  }) {
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
