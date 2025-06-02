class ResetPasswordSatate {}

class ResetPasswordInitial extends ResetPasswordSatate {}

class ResetPasswordLoading extends ResetPasswordSatate {}

class ResetPasswordSuccess extends ResetPasswordSatate {}

class ResetPasswordError extends ResetPasswordSatate {
  final String errorMessage;
  ResetPasswordError({required this.errorMessage});
}
