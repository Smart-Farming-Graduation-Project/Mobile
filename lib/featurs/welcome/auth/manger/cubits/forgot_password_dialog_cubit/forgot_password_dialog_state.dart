class ForgotPasswordDialogState {}

class InitialState extends ForgotPasswordDialogState {}

class LoadingState extends ForgotPasswordDialogState {}

class SuccessState extends ForgotPasswordDialogState {}

class ErrorState extends ForgotPasswordDialogState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
}
