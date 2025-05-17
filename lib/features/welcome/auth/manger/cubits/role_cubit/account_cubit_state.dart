 class AccountState {
  final String selectRole;

  AccountState({
    required this.selectRole,
  });
}

class InitialState extends AccountState {
  InitialState({required super.selectRole});
}

class BuyerState extends AccountState {
  BuyerState({required super.selectRole});
}

class FarmerState extends AccountState {
  FarmerState({required super.selectRole});
}
