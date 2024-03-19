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
  Set<ManaColor> selectedColors = {};

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
    if (whiteManaSelected) selectedColors.add(ManaColor.manaWhite);
    if (blueManaSelected) selectedColors.add(ManaColor.manaBlue);
    if (blackManaSelected) selectedColors.add(ManaColor.manaBlack);
    if (redManaSelected) selectedColors.add(ManaColor.manaRed);
    if (greenManaSelected) selectedColors.add(ManaColor.manaGreen);
    filterChanged?.call(selectedColors);
  }
}
