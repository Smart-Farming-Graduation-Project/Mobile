

import 'package:crop_guard/featurs/welcome/auth/manger/password_cubit.dart/password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordState(isObscure: true));

  void changeVisibility() {
    emit(PasswordState(isObscure: !state.isObscure));
  }
}
