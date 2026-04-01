import 'package:flutter/material.dart';
import 'home_page_widgets/top_menu_widget.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final bool showTopMenu;
  final Color backgroundColor;
  final Widget? footer;

  const MainLayout({
    super.key,
    required this.child,
    this.showTopMenu = true,
    this.backgroundColor = const Color(0xFF0A0A0D),
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            if (showTopMenu) const TopMenuWidget(),
            Expanded(child: child),
            if (footer != null) footer,
          ].whereType<Widget>().toList(),
        ),
      ),
    );
  }
}
