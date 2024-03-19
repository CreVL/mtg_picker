// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_bottom_sheet_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FilterBottomSheetController on FilterBottomSheetControllerBase, Store {
  late final _$whiteManaSelectedAtom = Atom(
      name: 'FilterBottomSheetControllerBase.whiteManaSelected',
      context: context);

  @override
  bool get whiteManaSelected {
    _$whiteManaSelectedAtom.reportRead();
    return super.whiteManaSelected;
  }

  @override
  set whiteManaSelected(bool value) {
    _$whiteManaSelectedAtom.reportWrite(value, super.whiteManaSelected, () {
      super.whiteManaSelected = value;
    });
  }

  late final _$blueManaSelectedAtom = Atom(
      name: 'FilterBottomSheetControllerBase.blueManaSelected',
      context: context);

  @override
  bool get blueManaSelected {
    _$blueManaSelectedAtom.reportRead();
    return super.blueManaSelected;
  }

  @override
  set blueManaSelected(bool value) {
    _$blueManaSelectedAtom.reportWrite(value, super.blueManaSelected, () {
      super.blueManaSelected = value;
    });
  }

  late final _$isFilterActivatedAtom = Atom(
      name: 'FilterBottomSheetControllerBase.isFilterActivated',
      context: context);

  @override
  bool get isFilterActivated {
    _$isFilterActivatedAtom.reportRead();
    return super.isFilterActivated;
  }

  @override
  set isFilterActivated(bool value) {
    _$isFilterActivatedAtom.reportWrite(value, super.isFilterActivated, () {
      super.isFilterActivated = value;
    });
  }

  late final _$blackManaSelectedAtom = Atom(
      name: 'FilterBottomSheetControllerBase.blackManaSelected',
      context: context);

  @override
  bool get blackManaSelected {
    _$blackManaSelectedAtom.reportRead();
    return super.blackManaSelected;
  }

  @override
  set blackManaSelected(bool value) {
    _$blackManaSelectedAtom.reportWrite(value, super.blackManaSelected, () {
      super.blackManaSelected = value;
    });
  }

  late final _$redManaSelectedAtom = Atom(
      name: 'FilterBottomSheetControllerBase.redManaSelected',
      context: context);

  @override
  bool get redManaSelected {
    _$redManaSelectedAtom.reportRead();
    return super.redManaSelected;
  }

  @override
  set redManaSelected(bool value) {
    _$redManaSelectedAtom.reportWrite(value, super.redManaSelected, () {
      super.redManaSelected = value;
    });
  }

  late final _$greenManaSelectedAtom = Atom(
      name: 'FilterBottomSheetControllerBase.greenManaSelected',
      context: context);

  @override
  bool get greenManaSelected {
    _$greenManaSelectedAtom.reportRead();
    return super.greenManaSelected;
  }

  @override
  set greenManaSelected(bool value) {
    _$greenManaSelectedAtom.reportWrite(value, super.greenManaSelected, () {
      super.greenManaSelected = value;
    });
  }

  late final _$transparentManaSelectedAtom = Atom(
      name: 'FilterBottomSheetControllerBase.transparentManaSelected',
      context: context);

  @override
  bool get transparentManaSelected {
    _$transparentManaSelectedAtom.reportRead();
    return super.transparentManaSelected;
  }

  @override
  set transparentManaSelected(bool value) {
    _$transparentManaSelectedAtom
        .reportWrite(value, super.transparentManaSelected, () {
      super.transparentManaSelected = value;
    });
  }

  late final _$selectedColorsAtom = Atom(
      name: 'FilterBottomSheetControllerBase.selectedColors', context: context);

  @override
  Set<ManaColor> get selectedColors {
    _$selectedColorsAtom.reportRead();
    return super.selectedColors;
  }

  @override
  set selectedColors(Set<ManaColor> value) {
    _$selectedColorsAtom.reportWrite(value, super.selectedColors, () {
      super.selectedColors = value;
    });
  }

  late final _$FilterBottomSheetControllerBaseActionController =
      ActionController(
          name: 'FilterBottomSheetControllerBase', context: context);

  @override
  void toggleWhiteMana() {
    final _$actionInfo = _$FilterBottomSheetControllerBaseActionController
        .startAction(name: 'FilterBottomSheetControllerBase.toggleWhiteMana');
    try {
      return super.toggleWhiteMana();
    } finally {
      _$FilterBottomSheetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleBlueMana() {
    final _$actionInfo = _$FilterBottomSheetControllerBaseActionController
        .startAction(name: 'FilterBottomSheetControllerBase.toggleBlueMana');
    try {
      return super.toggleBlueMana();
    } finally {
      _$FilterBottomSheetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleBlackMana() {
    final _$actionInfo = _$FilterBottomSheetControllerBaseActionController
        .startAction(name: 'FilterBottomSheetControllerBase.toggleBlackMana');
    try {
      return super.toggleBlackMana();
    } finally {
      _$FilterBottomSheetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleRedMana() {
    final _$actionInfo = _$FilterBottomSheetControllerBaseActionController
        .startAction(name: 'FilterBottomSheetControllerBase.toggleRedMana');
    try {
      return super.toggleRedMana();
    } finally {
      _$FilterBottomSheetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleGreenMana() {
    final _$actionInfo = _$FilterBottomSheetControllerBaseActionController
        .startAction(name: 'FilterBottomSheetControllerBase.toggleGreenMana');
    try {
      return super.toggleGreenMana();
    } finally {
      _$FilterBottomSheetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTransparentMana() {
    final _$actionInfo =
        _$FilterBottomSheetControllerBaseActionController.startAction(
            name: 'FilterBottomSheetControllerBase.toggleTransparentMana');
    try {
      return super.toggleTransparentMana();
    } finally {
      _$FilterBottomSheetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFilters() {
    final _$actionInfo = _$FilterBottomSheetControllerBaseActionController
        .startAction(name: 'FilterBottomSheetControllerBase.updateFilters');
    try {
      return super.updateFilters();
    } finally {
      _$FilterBottomSheetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
whiteManaSelected: ${whiteManaSelected},
blueManaSelected: ${blueManaSelected},
isFilterActivated: ${isFilterActivated},
blackManaSelected: ${blackManaSelected},
redManaSelected: ${redManaSelected},
greenManaSelected: ${greenManaSelected},
transparentManaSelected: ${transparentManaSelected},
selectedColors: ${selectedColors}
    ''';
  }
}
