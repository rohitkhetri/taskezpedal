abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthOtpSent extends AuthState {
  final String verificationId;

  AuthOtpSent({required this.verificationId});
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError(this.errorMessage);
}
