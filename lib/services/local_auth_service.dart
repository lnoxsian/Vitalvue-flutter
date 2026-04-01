class LocalAuthService {
  static const String demoEmployeeId = 'Maxel.R';
  static const String demoOtp = '123456';

  static bool canRequestOtp(String employeeId) {
    return employeeId.trim() == demoEmployeeId;
  }

  static bool canLogin({required String employeeId, required String otp}) {
    return employeeId.trim() == demoEmployeeId && otp.trim() == demoOtp;
  }
}