import 'base_state.dart';

sealed class HomeState extends BaseState {}

class HomeEmptyState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final String text;

  HomeSuccessState({this.text = 'Texto'});
}

class HomeFailureState extends HomeState {
  final String message;

  HomeFailureState(this.message);
}
