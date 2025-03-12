import 'package:crop_guard/featurs/welcome/auth/manger/cubits/terms_conditions_cubit/terms_and_conditions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsState>{
  TermsAndConditionsCubit():super(TermsAndConditionsState(isAccepted: false));
  void toggleAcceptance(){
    emit(TermsAndConditionsState(isAccepted: !state.isAccepted));
  }
}