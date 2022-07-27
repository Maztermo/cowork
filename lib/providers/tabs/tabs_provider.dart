import 'package:cowork/providers/tabs/tabs_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabsController = StateNotifierProvider<TabsController, TabsState>((ref) {
  return TabsController(TabsState(
    tabIndex: 0,
    pageController: PageController(),
  ));
});

class TabsController extends StateNotifier<TabsState> {
  TabsController(
    TabsState state,
  ) : super(state);

  updateTabIndex({required int newIndex}) {
    state = state.copyWith(tabIndex: newIndex);
  }

  goToPage(int i) {
    try {
      state.pageController.jumpToPage(
        i,
      );
      state = state.copyWith(tabIndex: i);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
