import 'package:crop_guard/featurs/cart/manger/models/address_model.dart';

class AddressSheetState {}

class AddressSheetLoadingState extends AddressSheetState {}
class AddressSavedEmptyState extends AddressSheetState {}

class AddressSavedState extends AddressSheetState {
  final int addressIndex;
  final List<AddressModel> addresses;
  AddressSavedState({required this.addresses, required this.addressIndex});
}