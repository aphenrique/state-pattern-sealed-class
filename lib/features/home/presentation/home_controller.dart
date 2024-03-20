import 'package:flutter/material.dart';
import 'package:state_management/features/home/presentation/home_state.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController() : super(HomeEmptyState());

  void empty() {
    value = HomeEmptyState();
  }

  void success() {
    value = HomeSuccessState(text: 'Outro valor');
  }

  void loading() {
    value = HomeLoadingState();
  }

  void failure() {
    value = HomeFailureState('mensagem');
  }
}
