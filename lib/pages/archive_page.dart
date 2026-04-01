import 'package:flutter/material.dart';
import 'archive_page_widgets/archive_search_widget.dart';
import 'archive_page_widgets/archive_list_widget.dart';
import 'main_layout.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      backgroundColor: const Color(0xFF141518),
      footer: _buildFooter(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 32),
            const ArchiveSearchWidget(),
            const SizedBox(height: 24),
            const ArchiveListWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          ),
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Archives',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Discharged / Ended Monitoring Records',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Row(
            children: [
              Icon(Icons.download_outlined, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                'Download PDF',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2028),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'Status Legend: ',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.circle, color: Color(0xFF44D17A), size: 10),
          const SizedBox(width: 6),
          const Text(
            'Stable',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.circle, color: Color(0xFFC79A54), size: 10),
          const SizedBox(width: 6),
          const Text(
            'Warning',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.circle, color: Color(0xFFFF5A5A), size: 10),
          const SizedBox(width: 6),
          const Text(
            'Critical',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF44D17A).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF44D17A).withValues(alpha: 0.3),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.wifi, color: Color(0xFF44D17A), size: 14),
                SizedBox(width: 6),
                Text(
                  'Connect to VitalVue Server',
                  style: TextStyle(color: Color(0xFF44D17A), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
