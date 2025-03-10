import 'package:flutter_bloc/flutter_bloc.dart';
import 'account_cubit_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(InitialState(selectRole: ''));

  void chooseBuyer() {
    emit(BuyerState(selectRole: 'Buyer'));
  }

  void chooseSeller() {
    emit(FarmerState(selectRole: 'Farmer'));
  }
}
