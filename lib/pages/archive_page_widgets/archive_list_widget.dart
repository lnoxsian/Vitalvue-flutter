import 'package:flutter/material.dart';

class ArchiveListWidget extends StatelessWidget {
  const ArchiveListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF22232B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Table header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                _buildCheckbox(),
                const SizedBox(width: 16),
                _buildHeaderCell('Patient Name', flex: 2),
                _buildHeaderCell('UHID', flex: 2),
                _buildHeaderCell('Ward / Bed', flex: 2),
                _buildHeaderCell('Monitoring Start', flex: 2),
                _buildHeaderCell('Monitoring End', flex: 2),
                _buildHeaderCell('Duration', flex: 1),
                _buildHeaderCell('Final NEWS2', flex: 2),
                _buildHeaderCell('Action', flex: 1, align: TextAlign.right),
              ],
            ),
          ),

          Container(height: 1, color: Colors.white.withValues(alpha: 0.1)),

          // List rows
          _buildRow(
            'Arthur Crane',
            'UH25-P-1049',
            'ICU / 301',
            '15 Nov 2025',
            '10 Dec 2025',
            '25 Days',
            'Low Risk',
            const Color(0xFF44D17A),
          ),
          _buildRow(
            'Michael Brown',
            'UH25-P-1052',
            'ICU / 305',
            '22 Nov 2025',
            '14 Dec 2025',
            '22 Days',
            'High Risk',
            const Color(0xFFFF5A5A),
          ),
          _buildRow(
            'Sophia Turner',
            'UH25-P-1053',
            'HDU / 214',
            '25 Nov 2025',
            '08 Dec 2025',
            '13 Days',
            'Medium Risk',
            const Color(0xFFC79A54),
          ),
          _buildRow(
            'Daniel Foster',
            'UH25-P-1054',
            'ICU / 309',
            '28 Nov 2025',
            '18 Dec 2025',
            '20 Days',
            'Low Risk',
            const Color(0xFF44D17A),
          ),
          _buildRow(
            'Olivia Harris',
            'UH25-P-1055',
            'HDU / 118',
            '30 Nov 2025',
            '16 Dec 2025',
            '16 Days',
            'Medium Risk',
            const Color(0xFFC79A54),
          ),
          _buildRow(
            'James Wilson',
            'UH25-P-1056',
            'General / 220',
            '01 Dec 2025',
            '17 Dec 2025',
            '16 Days',
            'Low Risk',
            const Color(0xFF44D17A),
          ),

          const SizedBox(height: 8),
          Container(height: 1, color: Colors.white.withValues(alpha: 0.1)),

          // Pagination footer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPageButton('1 Page'),
                Row(
                  children: [
                    _buildPageButton('1 Page'),
                    const SizedBox(width: 8),
                    _buildIconButton(Icons.chevron_left),
                    const SizedBox(width: 8),
                    _buildIconButton(Icons.chevron_right),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(
    String text, {
    required int flex,
    TextAlign align = TextAlign.left,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildRow(
    String name,
    String uhid,
    String ward,
    String start,
    String end,
    String duration,
    String risk,
    Color riskColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          _buildCheckbox(),
          const SizedBox(width: 16),
          _buildCell(name, flex: 2, isBold: true),
          _buildCell(uhid, flex: 2),
          _buildCell(ward, flex: 2),
          _buildCell(start, flex: 2),
          _buildCell(end, flex: 2),
          _buildCell(duration, flex: 1),
          Expanded(
            flex: 2,
            child: Text(
              risk,
              style: TextStyle(
                color: riskColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.download_outlined, color: Colors.white54, size: 20),
                SizedBox(width: 12),
                Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.white54,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCell(String text, {required int flex, bool isBold = false}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          color: isBold ? Colors.white : Colors.white70,
          fontSize: 14,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
    );
  }

  Widget _buildPageButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
