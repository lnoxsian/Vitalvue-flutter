import 'package:flutter/material.dart';

class StatusStripWidget extends StatelessWidget {
  const StatusStripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF22232B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _buildPill('Critical 4', const Color(0xFFFF4747)),
          const SizedBox(width: 12),
          _buildPill('Warning 5', const Color(0xFFFFD056)),
          const SizedBox(width: 12),
          _buildPill('Stable 6', const Color(0xFF44D17A)),
          const Spacer(),
          _buildActionButton('Show All Patients', filled: true),
          const SizedBox(width: 10),
          _buildActionButton('View Archives'),
        ],
      ),
    );
  }

  Widget _buildPill(String text, Color dotColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, color: dotColor, size: 12),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, {bool filled = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: filled ? const Color(0xFFCD9A53) : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: filled ? FontWeight.w700 : FontWeight.w600,
        ),
      ),
    );
  }
}
