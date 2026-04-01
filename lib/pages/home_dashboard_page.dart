import 'package:flutter/material.dart';

import 'home_page_widgets/patient_detail_card_widget.dart';
import 'home_page_widgets/status_strip_widget.dart';
import 'home_page_widgets/top_menu_widget.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0D),
      body: SafeArea(
        child: Column(
          children: [
            const TopMenuWidget(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Patient Details Cards',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const StatusStripWidget(),
                    const SizedBox(height: 34),
                    const Text(
                      'Patient Details Grid',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const PatientDetailCardWidget(
                      name: 'Sarah Jenkins',
                      id: 'PAT06',
                      roomNo: '7',
                      heartRate: '139',
                      spo2: '85%',
                      bp: '171/126',
                      temp: '38.4',
                      status: 'Disconnected',
                      battery: '80%',
                    ),
                    const SizedBox(height: 16),
                    const PatientDetailCardWidget(
                      name: 'Elena Vasquez',
                      id: 'PAT09',
                      roomNo: '10',
                      heartRate: '135',
                      spo2: '88%',
                      bp: '158/113',
                      temp: '36.9',
                      status: 'Connected',
                      battery: '95%',
                    ),
                  ],
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1B22),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      child: const Row(
        children: [
          Icon(Icons.circle, color: Color(0xFF44D17A), size: 10),
          SizedBox(width: 10),
          Text(
            'Connected to Cloud',
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          SizedBox(width: 14),
          Text(
            'Stable',
            style: TextStyle(color: Color(0xFF44D17A), fontSize: 18),
          ),
          Spacer(),
          Text(
            'Version: V1.2.0',
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
