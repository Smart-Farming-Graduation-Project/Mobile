class PasswordState {
  final bool isPasswordObscure;
  final bool isConfirmPasswordObscure;

  PasswordState({
    this.isPasswordObscure = true,
    this.isConfirmPasswordObscure = true,
  });

  PasswordState copyWith({
    bool? isPasswordObscure,
    bool? isConfirmPasswordObscure,
  }) {
    return PasswordState(
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      isConfirmPasswordObscure:
          isConfirmPasswordObscure ?? this.isConfirmPasswordObscure,
    );
  }
}
