import 'package:flutter/material.dart';

class AccountState {
  final Color personColor;
  final Color containerColor;
  final Color buttonColor;

  AccountState({required this.personColor, required this.containerColor, required this.buttonColor});

}

class SellerState extends AccountState {
  SellerState({required super.personColor, required super.containerColor, required super.buttonColor});

}

class BuyerState extends AccountState {
  BuyerState({required super.personColor, required super.containerColor, required super.buttonColor});

}
class InitialState extends AccountState {
  InitialState({required super.personColor, required super.containerColor, required super.buttonColor});

}