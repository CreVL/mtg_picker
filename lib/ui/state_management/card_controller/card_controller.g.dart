// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardController on CardControllerBase, Store {
  late final _$cardsToShowAtom =
      Atom(name: 'CardControllerBase.cardsToShow', context: context);

  @override
  ObservableList<Cards>? get cardsToShow {
    _$cardsToShowAtom.reportRead();
    return super.cardsToShow;
  }

  @override
  set cardsToShow(ObservableList<Cards>? value) {
    _$cardsToShowAtom.reportWrite(value, super.cardsToShow, () {
      super.cardsToShow = value;
    });
  }

  late final _$loadedCardsAtom =
      Atom(name: 'CardControllerBase.loadedCards', context: context);

  @override
  ObservableList<Cards>? get loadedCards {
    _$loadedCardsAtom.reportRead();
    return super.loadedCards;
  }

  @override
  set loadedCards(ObservableList<Cards>? value) {
    _$loadedCardsAtom.reportWrite(value, super.loadedCards, () {
      super.loadedCards = value;
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

  late final _$isLoadingMoreAtom =
      Atom(name: 'CardControllerBase.isLoadingMore', context: context);

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
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

  late final _$isFilteredAtom =
      Atom(name: 'CardControllerBase.isFiltered', context: context);

  @override
  bool get isFiltered {
    _$isFilteredAtom.reportRead();
    return super.isFiltered;
  }

  @override
  set isFiltered(bool value) {
    _$isFilteredAtom.reportWrite(value, super.isFiltered, () {
      super.isFiltered = value;
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

  late final _$isSearchingAtom =
      Atom(name: 'CardControllerBase.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$loadCardsAsyncAction =
      AsyncAction('CardControllerBase.loadCards', context: context);

  @override
  Future<dynamic> loadCards() {
    return _$loadCardsAsyncAction.run(() => super.loadCards());
  }

  late final _$loadMoreCardsAsyncAction =
      AsyncAction('CardControllerBase.loadMoreCards', context: context);

  @override
  Future<dynamic> loadMoreCards() {
    return _$loadMoreCardsAsyncAction.run(() => super.loadMoreCards());
  }

  late final _$toggleFavoritesFilterAsyncAction =
      AsyncAction('CardControllerBase.toggleFavoritesFilter', context: context);

  @override
  Future<dynamic> toggleFavoritesFilter() {
    return _$toggleFavoritesFilterAsyncAction
        .run(() => super.toggleFavoritesFilter());
  }

  late final _$buildCardsDependOnFilterAsyncAction = AsyncAction(
      'CardControllerBase.buildCardsDependOnFilter',
      context: context);

  @override
  Future<dynamic> buildCardsDependOnFilter() {
    return _$buildCardsDependOnFilterAsyncAction
        .run(() => super.buildCardsDependOnFilter());
  }

  late final _$CardControllerBaseActionController =
      ActionController(name: 'CardControllerBase', context: context);

  @override
  void filterCardsByNameContains(String text) {
    final _$actionInfo = _$CardControllerBaseActionController.startAction(
        name: 'CardControllerBase.filterCardsByNameContains');
    try {
      return super.filterCardsByNameContains(text);
    } finally {
      _$CardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardsToShow: ${cardsToShow},
loadedCards: ${loadedCards},
isLoading: ${isLoading},
isLoadingMore: ${isLoadingMore},
hasError: ${hasError},
isFiltered: ${isFiltered},
currentPage: ${currentPage},
isSearching: ${isSearching}
    ''';
  }
}
