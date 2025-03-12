class LoginState {}
class InitialState extends LoginState {}
class LoadingState extends LoginState {}
class SuccessState extends LoginState {

}
class ErrorState extends LoginState {
  final String errorMessage;

  ErrorState({required this.errorMessage});

}