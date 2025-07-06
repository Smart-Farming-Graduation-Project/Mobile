import 'package:equatable/equatable.dart';

abstract class MarketState extends Equatable {
  const MarketState();

  @override
  List<Object?> get props => [];
}

class MarketInitial extends MarketState {}

class MarketLoaded extends MarketState {
  final int pageIndex;

  const MarketLoaded({required this.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}

class MarketLoading extends MarketState {}

class MarketError extends MarketState {
  final String message;

  const MarketError({required this.message});

  @override
  List<Object?> get props => [message];
}
