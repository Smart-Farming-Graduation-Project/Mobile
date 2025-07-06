import 'package:flutter_bloc/flutter_bloc.dart';
import 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit() : super(const MarketLoaded(pageIndex: 0));

  void changePage(int index) {
    emit(MarketLoaded(pageIndex: index));
  }
}
