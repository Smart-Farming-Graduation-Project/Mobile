import 'package:crop_guard/features/welcome/auth/manger/cubits/terms_conditions_cubit/terms_and_conditions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsState>{
  TermsAndConditionsCubit():super(TermsAndConditionsState(isAccepted: false));
  bool isAccepted = false;
  void toggleAcceptance(){
    isAccepted = !isAccepted;
    emit(TermsAndConditionsState(isAccepted: isAccepted));
  }
}