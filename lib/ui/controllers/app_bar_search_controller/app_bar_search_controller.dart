import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'app_bar_search_controller.g.dart';

class AppBarSearchController = _AppBarSearchControllerBase
    with _$AppBarSearchController;

abstract class _AppBarSearchControllerBase with Store {
  final Function(String text)? searchChanged;

  _AppBarSearchControllerBase({
    required this.searchChanged,
  });

  @observable
  bool isSearchActivated = false;

  @observable
  bool canCleanSearch = false;

  TextEditingController textEditingController = TextEditingController();

  @action
  void cleanSearchField() {
    canCleanSearch = false;
    textEditingController.clear();
    searchChanged?.call(textEditingController.text);
  }

  @action
  void textChanged(String text) {
    canCleanSearch = textEditingController.text.isNotEmpty;
    searchChanged?.call(text);
  }

  @action
  void toggleSearchActivated() {
    isSearchActivated = !isSearchActivated;
    if (!isSearchActivated) {
      cleanSearchField();
    }
  }
}
