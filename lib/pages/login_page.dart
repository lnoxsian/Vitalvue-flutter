import 'package:flutter/material.dart';
import 'login_page_widgets/login_active_widgets.dart';
import 'login_page_widgets/auth_constants.dart';
import 'login_page_widgets/otp_verification_page.dart';
import '../services/local_auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _employeeIdController = TextEditingController();
  bool _staySignedIn = false;

  void _handleGenerateOtp() {
    final employeeId = _employeeIdController.text.trim();
    if (!LocalAuthService.canRequestOtp(employeeId)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demo login supports only user Maxel.R'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            OTPVerificationPage(employeeId: employeeId),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _employeeIdController.dispose();
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
                          color: Colors.grey.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                  ),
                ),
              // Right side - Login form
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
                          SizedBox(
                            height: AuthConstants.getResponsiveValue(
                              isTablet,
                              AuthConstants.tabletSpacing,
                              AuthConstants.phoneSpacing,
                            ),
                          ),

                          // Heading
                          Text(
                            'Secure Staff Authentication',
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
                            'Provide your verified credentials to log in securely.',
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

                          // Employee ID Input
                          LoginActiveWidgets.buildEmployeeIdField(
                            isTablet,
                            _employeeIdController,
                          ),
                          SizedBox(
                            height: AuthConstants.getResponsiveValue(
                              isTablet,
                              24,
                              20,
                            ),
                          ),

                          // Stay Signed In Checkbox
                          Row(
                            children: [
                              SizedBox(
                                width: AuthConstants.getResponsiveValue(
                                  isTablet,
                                  28,
                                  24,
                                ),
                                height: AuthConstants.getResponsiveValue(
                                  isTablet,
                                  28,
                                  24,
                                ),
                                child: Checkbox(
                                  value: _staySignedIn,
                                  onChanged: (value) {
                                    setState(() {
                                      _staySignedIn = value ?? false;
                                    });
                                  },
                                  fillColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                  side: BorderSide(
                                    color: Colors.grey[600]!,
                                    width: 2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Stay signed in on this device',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: AuthConstants.getResponsiveValue(
                                          isTablet,
                                          AuthConstants.labelFontTablet,
                                          AuthConstants.labelFontPhone,
                                        ),
                                        color: Colors.white70,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AuthConstants.getResponsiveValue(
                              isTablet,
                              32,
                              24,
                            ),
                          ),

                          // Generate OTP Button
                          LoginActiveWidgets.buildGenerateOtpButton(
                            isTablet,
                            _handleGenerateOtp,
                          ),
                          SizedBox(
                            height: AuthConstants.getResponsiveValue(
                              isTablet,
                              28,
                              20,
                            ),
                          ),

                          // Need Help Link
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Need help? Contact Support',
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
