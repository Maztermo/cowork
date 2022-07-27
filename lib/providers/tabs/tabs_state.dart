import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class TabsState extends Equatable {
  final int tabIndex;
  final PageController pageController;

  const TabsState({required this.tabIndex, required this.pageController});

  TabsState copyWith({
    int? tabIndex,
    PageController? pageController,
  }) {
    return TabsState(
        tabIndex: tabIndex ?? this.tabIndex,
        pageController: pageController ?? this.pageController);
  }

  @override
  List<Object?> get props => [
        tabIndex,
        pageController,
      ];
}
