class HomeState {
}
class HomeInitial extends HomeState {
  HomeInitial();
}
class HomeLoading extends HomeState {
  HomeLoading();
}
class HomeLoaded extends HomeState {
  final int pageIndex;
  HomeLoaded(this.pageIndex);
}
class HomeError extends HomeState {
  final String errorMessage;
  HomeError(this.errorMessage);
}
class HomeEmpty extends HomeState {
  HomeEmpty();
}