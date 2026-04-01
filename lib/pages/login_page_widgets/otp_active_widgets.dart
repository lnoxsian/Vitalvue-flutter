import 'package:flutter/material.dart';
import 'auth_constants.dart';

class OTPActiveWidgets {
  static Widget buildOtpInputFields(
    bool isTablet,
    List<TextEditingController> controllers,
    List<FocusNode> focusNodes,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => SizedBox(
          width: AuthConstants.getResponsiveValue(
            isTablet,
            AuthConstants.otpFieldSizeTablet,
            AuthConstants.otpFieldSizePhone,
          ),
          height: AuthConstants.getResponsiveValue(
            isTablet,
            AuthConstants.otpFieldSizeTablet,
            AuthConstants.otpFieldSizePhone,
          ),
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: TextStyle(
              fontSize: AuthConstants.getResponsiveValue(
                isTablet,
                AuthConstants.otpFontSizeTablet,
                AuthConstants.otpFontSizePhone,
              ),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              counterText: '',
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
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                focusNodes[index + 1].requestFocus();
              } else if (value.isEmpty && index > 0) {
                focusNodes[index - 1].requestFocus();
              }
            },
          ),
        ),
      ),
    );
  }

  static Widget buildVerifyButton(bool isTablet) {
    return SizedBox(
      width: double.infinity,
      height: AuthConstants.getResponsiveValue(
        isTablet,
        AuthConstants.buttonHeightTablet,
        AuthConstants.buttonHeightPhone,
      ),
      child: ElevatedButton(
        onPressed: () {},
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
        child: Text(
          'Verify & Log in',
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
      ),
    );
  }
}
