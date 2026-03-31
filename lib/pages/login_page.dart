import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _employeeIdController = TextEditingController();
  bool _staySignedIn = false;

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
      backgroundColor: const Color(0xFF1A1A1A),
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
                          color: Colors.grey.withOpacity(0.1),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Section
                          _buildHeader(isTablet),
                          SizedBox(height: isTablet ? 50 : 40),

                          // Heading
                          Text(
                            'Secure Staff Authentication',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontSize: isTablet ? 32 : 28,
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
                                  fontSize: isTablet ? 16 : 14,
                                  color: Colors.grey[400],
                                ),
                          ),
                          SizedBox(height: isTablet ? 48 : 36),

                          // Employee ID Input
                          _buildEmployeeIdField(isTablet),
                          SizedBox(height: isTablet ? 24 : 20),

                          // Stay Signed In Checkbox
                          Row(
                            children: [
                              SizedBox(
                                width: isTablet ? 28 : 24,
                                height: isTablet ? 28 : 24,
                                child: Checkbox(
                                  value: _staySignedIn,
                                  onChanged: (value) {
                                    setState(() {
                                      _staySignedIn = value ?? false;
                                    });
                                  },
                                  fillColor: MaterialStateProperty.all(
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
                                        fontSize: isTablet ? 15 : 13,
                                        color: Colors.white70,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: isTablet ? 32 : 24),

                          // Generate OTP Button
                          _buildGenerateOtpButton(isTablet),
                          SizedBox(height: isTablet ? 28 : 20),

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
                                      fontSize: isTablet ? 14 : 12,
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

  Widget _buildHeader(bool isTablet) {
    return Row(
      children: [
        // Logo Placeholder
        Container(
          width: isTablet ? 80 : 64,
          height: isTablet ? 80 : 64,
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Logo',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: isTablet ? 14 : 12,
              ),
            ),
          ),
        ),
        SizedBox(width: isTablet ? 20 : 16),
        // Brand Name and Badge
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VitalVue',
              style: TextStyle(
                fontSize: isTablet ? 28 : 24,
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
                  fontSize: isTablet ? 12 : 10,
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

  Widget _buildEmployeeIdField(bool isTablet) {
    return TextField(
      controller: _employeeIdController,
      style: TextStyle(
        fontSize: isTablet ? 16 : 14,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: 'Employee ID*',
        hintStyle: TextStyle(
          fontSize: isTablet ? 16 : 14,
          color: Colors.grey[600],
        ),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey[700]!,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey[700]!,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFD4A574),
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: isTablet ? 20 : 16,
          vertical: isTablet ? 18 : 16,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(isTablet ? 16 : 12),
          child: Icon(
            Icons.qr_code,
            color: Colors.grey[600],
            size: isTablet ? 24 : 20,
          ),
        ),
      ),
    );
  }

  Widget _buildGenerateOtpButton(bool isTablet) {
    return SizedBox(
      width: double.infinity,
      height: isTablet ? 56 : 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD4A574),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isTablet ? 14 : 12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Generate OTP',
              style: TextStyle(
                fontSize: isTablet ? 16 : 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2A2A2A),
              ),
            ),
            SizedBox(width: isTablet ? 12 : 8),
            Icon(
              Icons.arrow_forward,
              color: const Color(0xFF2A2A2A),
              size: isTablet ? 20 : 18,
            ),
          ],
        ),
      ),
    );
  }
}
