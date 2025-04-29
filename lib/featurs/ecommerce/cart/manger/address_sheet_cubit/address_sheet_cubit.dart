import 'package:crop_guard/featurs/ecommerce/cart/manger/address_sheet_cubit/address_sheet_state.dart';
import 'package:crop_guard/featurs/ecommerce/cart/manger/models/address_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSheetCubit extends Cubit<AddressSheetState> {
  AddressSheetCubit() : super(AddressSheetLoadingState());
  final int addressIndex = -1;

  Future<void> loadSavedAddress() async {
    emit(AddressSheetLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    if (1 == 1) {
      emit(AddressSavedState(
          addresses: demoAddresses, addressIndex: addressIndex));
    } else {
      emit(AddressSavedEmptyState());
    }
  }

  void selectAddress(int index) {
    emit(AddressSavedState(addresses: demoAddresses, addressIndex: index));
  }
}
