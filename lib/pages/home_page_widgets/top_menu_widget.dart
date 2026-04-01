import 'package:flutter/material.dart';

class TopMenuWidget extends StatelessWidget {
  const TopMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      decoration: BoxDecoration(
        color: const Color(0xFF1E2028),
        border: Border(
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the remaining space manually so we don't crash the Row
          // with a Spacer inside an unbounded SingleChildScrollView.
          // 1200 is roughly the combined width of all fixed elements in the bar.
          final double extraSpace = constraints.maxWidth - 1200;
          
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                width: 102,
                height: 102,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                ),
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'Logo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 28),
              const Text(
                'VitalVue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.8,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 26),
                padding: const EdgeInsets.only(left: 26),
                height: 102,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.8,
                  ),
                ),
              ),
              SizedBox(width: extraSpace > 20 ? extraSpace : 20),
              Container(
                height: 62,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(31),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 46,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'All Wards',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      color: Colors.white.withValues(alpha: 0.16),
                    ),
                    const Icon(Icons.search, color: Colors.white70, size: 26),
                    const SizedBox(width: 12),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Search patient or ID...',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 26),
              const _RoundIconButton(icon: Icons.notifications_none_outlined),
              const SizedBox(width: 14),
              const _RoundIconButton(icon: Icons.hexagon_outlined),
              Container(
                height: 36,
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 22),
                color: Colors.white.withValues(alpha: 0.16),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Nurse Clara Barton',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFD9E2F3).withValues(alpha: 0.9),
                      const Color(0xFF8C9AB3),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  color: Color(0xFF2D3442),
                  size: 32,
                ),
              ),
              const SizedBox(width: 18),
            ],
          ),
          );
        },
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white70, size: 26),
    );
  }
}
