class LoginState {}

class InitialState extends LoginState {}

class LoadingState extends LoginState {}

class SuccessState extends LoginState {
  final String role;
  SuccessState({required this.role});
}

class ErrorState extends LoginState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
