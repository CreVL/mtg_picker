import 'package:mobx/mobx.dart';
import '../../../domain/enums/mana_color.dart';

part 'filter_bottom_sheet_controller.g.dart';

class FilterBottomSheetController = FilterBottomSheetControllerBase
    with _$FilterBottomSheetController;

abstract class FilterBottomSheetControllerBase with Store {
  final Function(Set<ManaColor>)? filterChanged;

  FilterBottomSheetControllerBase({this.filterChanged});

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
  bool transparentManaSelected = false;

  @observable
  Set<ManaColor> selectedColors = {};

  @action
  void toggleWhiteMana() {
    whiteManaSelected = !whiteManaSelected;
    if (whiteManaSelected && !transparentManaSelected) {
      transparentManaSelected = true;
    }
    updateFilters();
  }

  @action
  void toggleBlueMana() {
    blueManaSelected = !blueManaSelected;
    if (blueManaSelected && !transparentManaSelected) {
      transparentManaSelected = true;
    }
    updateFilters();
  }

  @action
  void toggleBlackMana() {
    blackManaSelected = !blackManaSelected;
    if (blackManaSelected && !transparentManaSelected) {
      transparentManaSelected = true;
    }
    updateFilters();
  }

  @action
  void toggleRedMana() {
    redManaSelected = !redManaSelected;
    if (redManaSelected && !transparentManaSelected) {
      transparentManaSelected = true;
    }
    updateFilters();
  }

  @action
  void toggleGreenMana() {
    greenManaSelected = !greenManaSelected;
    if (greenManaSelected && !transparentManaSelected) {
      transparentManaSelected = true;
    }
    updateFilters();
  }

  @action
  void toggleTransparentMana() {
    transparentManaSelected = !transparentManaSelected;
    if (!transparentManaSelected && selectedColors.isEmpty) {
      transparentManaSelected = true;
    }
    updateFilters();
  }

  @action
  void updateFilters() {
    selectedColors.clear();
    if (whiteManaSelected) selectedColors.add(ManaColor.manaWhite);
    if (blueManaSelected) selectedColors.add(ManaColor.manaBlue);
    if (blackManaSelected) selectedColors.add(ManaColor.manaBlack);
    if (redManaSelected) selectedColors.add(ManaColor.manaRed);
    if (greenManaSelected) selectedColors.add(ManaColor.manaGreen);
    if (transparentManaSelected && selectedColors.isNotEmpty) {
      selectedColors.add(ManaColor.manaTransparent);
    }
    if (selectedColors.isEmpty) {
      transparentManaSelected = false;
    }
    filterChanged?.call(selectedColors);
  }
}
