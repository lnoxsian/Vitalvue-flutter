import 'package:flutter/material.dart';
import 'otp_active_widgets.dart';
import 'login_active_widgets.dart';
import 'auth_constants.dart';

class OTPVerificationPage extends StatefulWidget {
  final String employeeId;

  const OTPVerificationPage({
    Key? key,
    required this.employeeId,
  }) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _otpFocusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context);
    final isTablet = screenSize.size.width > 600;
    final isMediumScreen = screenSize.size.width > 1000;

    return Scaffold(
      backgroundColor: AuthConstants.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.size.height,
          child: Row(
            children: [
              // Left side - Background image or gradient (for larger tablets)
              if (isMediumScreen)
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: AuthConstants.gradientColors,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
                ),
              // Right side - OTP form
              Expanded(
                flex: isMediumScreen ? 1 : 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AuthConstants.getContentPadding(
                      isTablet,
                      isMediumScreen,
                    ),
                    vertical: AuthConstants.verticalPaddingOuter,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: AuthConstants.maxContentWidth),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Section
                          LoginActiveWidgets.buildHeader(isTablet),
                          SizedBox(height: isTablet ? 50 : 40),

                          // Heading
                          Text(
                            'Verify OTP',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontSize: AuthConstants.getResponsiveValue(
                                    isTablet,
                                    AuthConstants.headingFontTablet,
                                    AuthConstants.headingFontPhone,
                                  ),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                          ),
                          SizedBox(height: 12),

                          // Subtitle
                          Text(
                            'Verification code successfully sent to your registered mobile number.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: AuthConstants.getResponsiveValue(
                                    isTablet,
                                    AuthConstants.subtitleFontTablet,
                                    AuthConstants.subtitleFontPhone,
                                  ),
                                  color: Colors.grey[400],
                                ),
                          ),
                          SizedBox(
                            height: AuthConstants.getResponsiveValue(
                              isTablet,
                              AuthConstants.tabletSpacing,
                              AuthConstants.phoneSpacing,
                            ),
                          ),

                          // OTP Input Fields
                          OTPActiveWidgets.buildOtpInputFields(
                            isTablet,
                            _otpControllers,
                            _otpFocusNodes,
                          ),
                          SizedBox(
                            height: AuthConstants.getResponsiveValue(
                              isTablet,
                              24,
                              20,
                            ),
                          ),

                          // OTP Sent To
                          Text(
                            'OTP sent to: ****7777',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: AuthConstants.getResponsiveValue(
                                    isTablet,
                                    AuthConstants.linkFontTablet,
                                    AuthConstants.linkFontPhone,
                                  ),
                                  color: Colors.grey[400],
                                ),
                          ),
                          SizedBox(height: 12),

                          // Wrong Number Link
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'Wrong number? Change number',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: AuthConstants.getResponsiveValue(
                                      isTablet,
                                      AuthConstants.linkFontTablet,
                                      AuthConstants.linkFontPhone,
                                    ),
                                    color: Colors.blue[400],
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: AuthConstants.getResponsiveValue(
                              isTablet,
                              32,
                              24,
                            ),
                          ),

                          // Verify & Log In Button
                          OTPActiveWidgets.buildVerifyButton(isTablet),
                          SizedBox(
                            height: AuthConstants.getResponsiveValue(
                              isTablet,
                              20,
                              16,
                            ),
                          ),

                          // Resend OTP Link
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Resend OTP',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: AuthConstants.getResponsiveValue(
                                        isTablet,
                                        AuthConstants.linkFontTablet,
                                        AuthConstants.linkFontPhone,
                                      ),
                                      color: Colors.grey[400],
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
