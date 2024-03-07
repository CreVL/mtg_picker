// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bar_search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppBarSearchController on _AppBarSearchControllerBase, Store {
  late final _$isSearchActivatedAtom = Atom(
      name: '_AppBarSearchControllerBase.isSearchActivated', context: context);

  @override
  bool get isSearchActivated {
    _$isSearchActivatedAtom.reportRead();
    return super.isSearchActivated;
  }

  @override
  set isSearchActivated(bool value) {
    _$isSearchActivatedAtom.reportWrite(value, super.isSearchActivated, () {
      super.isSearchActivated = value;
    });
  }

  late final _$canCleanSearchAtom = Atom(
      name: '_AppBarSearchControllerBase.canCleanSearch', context: context);

  @override
  bool get canCleanSearch {
    _$canCleanSearchAtom.reportRead();
    return super.canCleanSearch;
  }

  @override
  set canCleanSearch(bool value) {
    _$canCleanSearchAtom.reportWrite(value, super.canCleanSearch, () {
      super.canCleanSearch = value;
    });
  }

  late final _$_AppBarSearchControllerBaseActionController =
      ActionController(name: '_AppBarSearchControllerBase', context: context);

  @override
  void cleanSearchField() {
    final _$actionInfo = _$_AppBarSearchControllerBaseActionController
        .startAction(name: '_AppBarSearchControllerBase.cleanSearchField');
    try {
      return super.cleanSearchField();
    } finally {
      _$_AppBarSearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void textChanged(String text) {
    final _$actionInfo = _$_AppBarSearchControllerBaseActionController
        .startAction(name: '_AppBarSearchControllerBase.textChanged');
    try {
      return super.textChanged(text);
    } finally {
      _$_AppBarSearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSearchActivated() {
    final _$actionInfo = _$_AppBarSearchControllerBaseActionController
        .startAction(name: '_AppBarSearchControllerBase.toggleSearchActivated');
    try {
      return super.toggleSearchActivated();
    } finally {
      _$_AppBarSearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearchActivated: ${isSearchActivated},
canCleanSearch: ${canCleanSearch}
    ''';
  }
}
