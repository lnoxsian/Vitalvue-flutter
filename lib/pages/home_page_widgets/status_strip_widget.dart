import 'package:flutter/material.dart';
import '../archive_page.dart';

class StatusStripWidget extends StatelessWidget {
  final int criticalCount;
  final int warningCount;
  final int stableCount;

  const StatusStripWidget({
    super.key,
    this.criticalCount = 0,
    this.warningCount = 0,
    this.stableCount = 0,
  });

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
          _buildPill('Critical $criticalCount', const Color(0xFFFF4747)),
          const SizedBox(width: 12),
          _buildPill('Warning $warningCount', const Color(0xFFFFD056)),
          const SizedBox(width: 12),
          _buildPill('Stable $stableCount', const Color(0xFF44D17A)),
          const Spacer(),
          _buildActionButton(context, 'Show All Patients', filled: true),
          const SizedBox(width: 10),
          _buildActionButton(context, 'View Archives'),
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

  Widget _buildActionButton(
    BuildContext context,
    String text, {
    bool filled = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (text == 'View Archives') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ArchivePage()),
          );
        }
      },
      child: Container(
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
      ),
    );
  }
}
