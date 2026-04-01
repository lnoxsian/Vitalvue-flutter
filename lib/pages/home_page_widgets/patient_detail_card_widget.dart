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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF22232B),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFFF3D3D), width: 2),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 260,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Id: $id',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'R.No: $roomNo',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _metricPanel(
              'Heart Rate',
              '$heartRate bpm',
              Icons.monitor_heart_outlined,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: _metricPanel('SpO2', spo2, Icons.bloodtype_outlined)),
          const SizedBox(width: 12),
          Expanded(
            child: _metricPanel('BP Trend', '$bp mmHg', Icons.show_chart),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _metricPanel('Temp', '$temp c', Icons.thermostat_outlined),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 260,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Disconnected',
                        style: TextStyle(
                          color: Color(0xFFFF5A5A),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Battery 80%',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricPanel(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFFFF7B7B), size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFFFBF66).withValues(alpha: 0.65),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
