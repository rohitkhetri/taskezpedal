abstract class AuthEvent {}

class AuthSignInRequested extends AuthEvent {
  final String email;
  final String password;

  AuthSignInRequested({required this.email, required this.password});
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpRequested({required this.email, required this.password});
}

class AuthPhoneSignUpRequested extends AuthEvent {
  final String phoneNumber;

  AuthPhoneSignUpRequested({required this.phoneNumber});
}

class AuthVerifyPhoneOtp extends AuthEvent {
  final String verificationId;
  final String otp;

  AuthVerifyPhoneOtp({required this.verificationId, required this.otp});
}
