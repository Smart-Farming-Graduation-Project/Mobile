abstract class RegisterState {}

class RegisterRoleSelectedState extends RegisterState {
  final String selectedRole;
  RegisterRoleSelectedState(this.selectedRole);
}

 class AccountTypestate extends RegisterState {}
 class FirstSignUpState extends RegisterState {}
 class FirstSignUpErrorState extends RegisterState {
  final String errorMessage;
  FirstSignUpErrorState({required this.errorMessage});
 }
 class FirstSignUpLoadingState extends RegisterState {}
 class SecondSignUpState extends RegisterState {}
 class SecondSignUpErrorState extends RegisterState {
  final String errorMessage;
  SecondSignUpErrorState({required this.errorMessage});
 }
 class SecondSignUpLoadingState extends RegisterState {}
 class RegisterSuccessState extends RegisterState {}
 