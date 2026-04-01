import 'package:flutter/material.dart';

class AuthConstants {
  // Colors
  static const Color backgroundColor = Color(0xFF1A1A1A);
  static const Color darkContainerColor = Color(0xFF2A2A2A);
  static const Color accentColor = Color(0xFFD4A574);
  static const Color inputFillColor = Colors.grey;
  
  // Spacing values
  static const double tabletSpacing = 50;
  static const double phoneSpacing = 40;
  
  static const double contentPaddingTablet = 60;
  static const double contentPaddingMedium = 40;
  static const double contentPaddingPhone = 24;
  
  static const double verticalPaddingOuter = 24;
  static const double maxContentWidth = 500;
  
  // Font sizes
  static const double headingFontTablet = 32;
  static const double headingFontPhone = 28;
  
  static const double subtitleFontTablet = 16;
  static const double subtitleFontPhone = 14;
  
  static const double labelFontTablet = 15;
  static const double labelFontPhone = 13;
  
  static const double linkFontTablet = 14;
  static const double linkFontPhone = 12;
  
  // Button sizing
  static const double buttonHeightTablet = 56;
  static const double buttonHeightPhone = 50;
  
  static const double buttonRadiusTablet = 14;
  static const double buttonRadiusPhone = 12;
  
  // Input field sizing
  static const double inputRadiusTablet = 12;
  static const double inputRadiusPhone = 12;
  
  static const double inputPaddingHorizontalTablet = 20;
  static const double inputPaddingHorizontalPhone = 16;
  
  static const double inputPaddingVerticalTablet = 18;
  static const double inputPaddingVerticalPhone = 16;
  
  static const double borderWidth = 2;
  
  // OTP field sizing
  static const double otpFieldSizeTablet = 60;
  static const double otpFieldSizePhone = 50;
  
  static const double otpFontSizeTablet = 24;
  static const double otpFontSizePhone = 20;
  
  // Logo sizing
  static const double logoPaddingTablet = 20;
  static const double logoPaddingPhone = 16;
  
  static const double logoSizeTablet = 80;
  static const double logoSizePhone = 64;
  
  static const double logoRadiusTablet = 12;
  static const double logoRadiusPhone = 12;
  
  // Gradient colors for left panel
  static const List<Color> gradientColors = [
    backgroundColor,
    darkContainerColor,
  ];
  
  // Helper method to get responsive value
  static double getResponsiveValue(
    bool isTablet,
    double tabletValue,
    double phoneValue,
  ) {
    return isTablet ? tabletValue : phoneValue;
  }
  
  // Helper method to get responsive spacing
  static double getContentPadding(bool isTablet, bool isMediumScreen) {
    if (isMediumScreen) return contentPaddingTablet;
    if (isTablet) return contentPaddingMedium;
    return contentPaddingPhone;
  }
}
