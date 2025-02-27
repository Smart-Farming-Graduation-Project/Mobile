class LoguinState {}
class InitialState extends LoguinState {}
class LoadingState extends LoguinState {}
class SuccessState extends LoguinState {

}
class ErrorState extends LoguinState {
  final String errorMessage;

  ErrorState({required this.errorMessage});

}