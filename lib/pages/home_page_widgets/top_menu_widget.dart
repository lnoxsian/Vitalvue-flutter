import 'package:flutter/material.dart';
import '../home_dashboard_page.dart';
import 'top_menu_submenu_widget/top_menu_notification_widget.dart';
import 'top_menu_submenu_widget/top_menu_profile_widget.dart';

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
                GestureDetector(
                  onTap: () {
                    // We only want to push the destination if we are not already on it
                    // Given we don't have named routes check on current ModalRoute,
                    // we'll just pushReplacement back to Dashboard
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeDashboardPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 26),
                    height: 102,
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
                ),
                SizedBox(width: extraSpace > 20 ? (extraSpace * 0.5) : 20),
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
                SizedBox(width: extraSpace > 20 ? (extraSpace * 0.5) : 20),
                Builder(
                  builder: (buttonContext) {
                    return _RoundIconButton(
                      icon: Icons.notifications_none_outlined,
                      onTap: () {
                        final RenderBox renderBox =
                            buttonContext.findRenderObject() as RenderBox;
                        final offset = renderBox.localToGlobal(Offset.zero);
                        showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (context) {
                            return Stack(
                              children: [
                                // Tap outside to dismiss
                                Positioned.fill(
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    behavior: HitTestBehavior.opaque,
                                  ),
                                ),
                                Positioned(
                                  top: offset.dy + renderBox.size.height + 16,
                                  // Center the 390-width popup beneath the button
                                  left:
                                      offset.dx -
                                      (390 / 2) +
                                      (renderBox.size.width / 2),
                                  child: const Material(
                                    color: Colors.transparent,
                                    child: TopMenuNotificationWidget(),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
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
                Builder(
                  builder: (profileContext) {
                    return GestureDetector(
                      onTap: () {
                        final RenderBox renderBox =
                            profileContext.findRenderObject() as RenderBox;
                        final offset = renderBox.localToGlobal(Offset.zero);
                        showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (context) {
                            return Stack(
                              children: [
                                Positioned.fill(
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    behavior: HitTestBehavior.opaque,
                                  ),
                                ),
                                Positioned(
                                  top: offset.dy + renderBox.size.height + 16,
                                  left: offset.dx - 260 + renderBox.size.width,
                                  child: const Material(
                                    color: Colors.transparent,
                                    child: TopMenuProfileWidget(),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
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
                    );
                  },
                ),
                const SizedBox(width: 48),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white70, size: 26),
      ),
    );
  }
}
