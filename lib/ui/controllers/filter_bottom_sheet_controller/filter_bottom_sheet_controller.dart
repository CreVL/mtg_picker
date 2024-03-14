import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../resources/app_colors.dart';
part 'filter_bottom_sheet_controller.g.dart';

class FilterBottomSheetController = FilterBottomSheetControllerBase
    with _$FilterBottomSheetController;

abstract class FilterBottomSheetControllerBase with Store {
  final Function(Set<Color>) filterChanged;

  FilterBottomSheetControllerBase({required this.filterChanged});

  @observable
  bool whiteManaSelected = false;

  @observable
  bool blueManaSelected = false;

  @observable
  bool isFilterActivated = false;

  @observable
  bool blackManaSelected = false;

  @observable
  bool redManaSelected = false;

  @observable
  bool greenManaSelected = false;

  @observable
  Set<Color> selectedColors = {};

  @action
  void toggleWhiteMana() {
    whiteManaSelected = !whiteManaSelected;
    updateFilters();
  }

  @action
  void toggleBlueMana() {
    blueManaSelected = !blueManaSelected;
    updateFilters();
  }

  @action
  void toggleBlackMana() {
    blackManaSelected = !blackManaSelected;
    updateFilters();
  }

  @action
  void toggleRedMana() {
    redManaSelected = !redManaSelected;
    updateFilters();
  }

  @action
  void toggleGreenMana() {
    greenManaSelected = !greenManaSelected;
    updateFilters();
  }

  @action
  void updateFilters() {
    selectedColors.clear();
    if (whiteManaSelected) selectedColors.add(AppColors.whiteMana);
    if (blueManaSelected) selectedColors.add(AppColors.blueMana);
    if (blackManaSelected) selectedColors.add(AppColors.blackMana);
    if (redManaSelected) selectedColors.add(AppColors.redMana);
    if (greenManaSelected) selectedColors.add(AppColors.greenMana);
    filterChanged(selectedColors);
  }
}
