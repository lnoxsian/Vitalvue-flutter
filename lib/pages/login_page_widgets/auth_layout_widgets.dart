import 'package:flutter/material.dart';

class AuthLayoutWidgets {
  // Common layout wrapper for authentication pages
  static Widget buildAuthLayout(
    bool isTablet,
    bool isMediumScreen,
    Widget content,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000, // This should be handled by parent widget's height
          child: Row(
            children: [
              // Left side - Background
              if (isMediumScreen) _buildLeftBackground(),
              // Right side - Content
              Expanded(
                flex: isMediumScreen ? 1 : 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMediumScreen
                        ? 60
                        : isTablet
                            ? 40
                            : 24,
                    vertical: 24,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 500),
                      child: content,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildLeftBackground() {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF1A1A1A),
              const Color(0xFF2A2A2A),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withValues(alpha: 0.1),
            ),
          ),
        ),
      ),
    );
  }

  // Common heading text
  static Widget buildHeading(
    BuildContext context,
    String text,
    bool isTablet,
  ) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: isTablet ? 32 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
    );
  }

  // Common subtitle text
  static Widget buildSubtitle(
    BuildContext context,
    String text,
    bool isTablet,
  ) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: isTablet ? 16 : 14,
            color: Colors.grey[400],
          ),
    );
  }

  // Common link button
  static Widget buildLinkButton(
    BuildContext context,
    String text,
    bool isTablet,
    VoidCallback onPressed,
  ) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: isTablet ? 14 : 12,
              color: Colors.blue[400],
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }

  // Common centered link button
  static Widget buildCenteredLinkButton(
    BuildContext context,
    String text,
    bool isTablet,
    VoidCallback onPressed,
  ) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: isTablet ? 14 : 12,
                color: Colors.grey[400],
                decoration: TextDecoration.underline,
              ),
        ),
      ),
    );
  }

  // Common vertical spacing
  static SizedBox getVerticalSpacing(bool isTablet, double tabletValue, double phoneValue) {
    return SizedBox(height: isTablet ? tabletValue : phoneValue);
  }
}
