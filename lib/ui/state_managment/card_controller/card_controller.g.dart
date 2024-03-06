// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardController on CardControllerBase, Store {
  late final _$cardsAtom =
      Atom(name: 'CardControllerBase.cards', context: context);

  @override
  ObservableList<Cards> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<Cards> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'CardControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: 'CardControllerBase.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: 'CardControllerBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$loadCardsAsyncAction =
      AsyncAction('CardControllerBase.loadCards', context: context);

  @override
  Future<void> loadCards() {
    return _$loadCardsAsyncAction.run(() => super.loadCards());
  }

  late final _$loadMoreCardsAsyncAction =
      AsyncAction('CardControllerBase.loadMoreCards', context: context);

  @override
  Future<void> loadMoreCards() {
    return _$loadMoreCardsAsyncAction.run(() => super.loadMoreCards());
  }

  @override
  String toString() {
    return '''
cards: ${cards},
isLoading: ${isLoading},
hasError: ${hasError},
currentPage: ${currentPage}
    ''';
  }
}
