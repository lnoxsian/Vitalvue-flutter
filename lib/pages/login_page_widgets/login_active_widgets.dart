import 'package:flutter/material.dart';
import 'auth_constants.dart';

class LoginActiveWidgets {
  static Widget buildHeader(bool isTablet) {
    return Row(
      children: [
        // Logo Placeholder
        Container(
          width: AuthConstants.getResponsiveValue(
            isTablet,
            AuthConstants.logoSizeTablet,
            AuthConstants.logoSizePhone,
          ),
          height: AuthConstants.getResponsiveValue(
            isTablet,
            AuthConstants.logoSizeTablet,
            AuthConstants.logoSizePhone,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(AuthConstants.logoRadiusPhone),
          ),
          child: Center(
            child: Text(
              'Logo',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: AuthConstants.getResponsiveValue(
                  isTablet,
                  14,
                  12,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: AuthConstants.getResponsiveValue(
            isTablet,
            AuthConstants.logoPaddingTablet,
            AuthConstants.logoPaddingPhone,
          ),
        ),
        // Brand Name and Badge
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VitalVue',
              style: TextStyle(
                fontSize: AuthConstants.getResponsiveValue(
                  isTablet,
                  28,
                  24,
                ),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'SYSTEM',
                style: TextStyle(
                  fontSize: AuthConstants.getResponsiveValue(
                    isTablet,
                    12,
                    10,
                  ),
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget buildEmployeeIdField(
    bool isTablet,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: AuthConstants.getResponsiveValue(
          isTablet,
          AuthConstants.subtitleFontTablet,
          AuthConstants.subtitleFontPhone,
        ),
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: 'Employee ID*',
        hintStyle: TextStyle(
          fontSize: AuthConstants.getResponsiveValue(
            isTablet,
            AuthConstants.subtitleFontTablet,
            AuthConstants.subtitleFontPhone,
          ),
          color: Colors.grey[600],
        ),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AuthConstants.inputRadiusPhone),
          borderSide: BorderSide(
            color: Colors.grey[700]!,
            width: AuthConstants.borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AuthConstants.inputRadiusPhone),
          borderSide: BorderSide(
            color: Colors.grey[700]!,
            width: AuthConstants.borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AuthConstants.inputRadiusPhone),
          borderSide: const BorderSide(
            color: AuthConstants.accentColor,
            width: AuthConstants.borderWidth,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AuthConstants.getResponsiveValue(
            isTablet,
            AuthConstants.inputPaddingHorizontalTablet,
            AuthConstants.inputPaddingHorizontalPhone,
          ),
          vertical: AuthConstants.getResponsiveValue(
            isTablet,
            AuthConstants.inputPaddingVerticalTablet,
            AuthConstants.inputPaddingVerticalPhone,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(AuthConstants.getResponsiveValue(
            isTablet,
            16,
            12,
          )),
          child: Icon(
            Icons.qr_code,
            color: Colors.grey[600],
            size: AuthConstants.getResponsiveValue(
              isTablet,
              24,
              20,
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildGenerateOtpButton(
    bool isTablet,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: AuthConstants.getResponsiveValue(
        isTablet,
        AuthConstants.buttonHeightTablet,
        AuthConstants.buttonHeightPhone,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AuthConstants.accentColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AuthConstants.getResponsiveValue(
                isTablet,
                AuthConstants.buttonRadiusTablet,
                AuthConstants.buttonRadiusPhone,
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Generate OTP',
              style: TextStyle(
                fontSize: AuthConstants.getResponsiveValue(
                  isTablet,
                  16,
                  14,
                ),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2A2A2A),
              ),
            ),
            SizedBox(
              width: AuthConstants.getResponsiveValue(
                isTablet,
                12,
                8,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: const Color(0xFF2A2A2A),
              size: AuthConstants.getResponsiveValue(
                isTablet,
                20,
                18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
