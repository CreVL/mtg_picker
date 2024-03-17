// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardController on CardControllerBase, Store {
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

  late final _$isPagginationAtom =
      Atom(name: 'CardControllerBase.isPaggination', context: context);

  @override
  bool get isPaggination {
    _$isPagginationAtom.reportRead();
    return super.isPaggination;
  }

  @override
  set isPaggination(bool value) {
    _$isPagginationAtom.reportWrite(value, super.isPaggination, () {
      super.isPaggination = value;
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

  late final _$isFavoriteFilterAtom =
      Atom(name: 'CardControllerBase.isFavoriteFilter', context: context);

  @override
  bool get isFavoriteFilter {
    _$isFavoriteFilterAtom.reportRead();
    return super.isFavoriteFilter;
  }

  @override
  set isFavoriteFilter(bool value) {
    _$isFavoriteFilterAtom.reportWrite(value, super.isFavoriteFilter, () {
      super.isFavoriteFilter = value;
    });
  }

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

  late final _$isManaCostFilterAtom =
      Atom(name: 'CardControllerBase.isManaCostFilter', context: context);

  @override
  bool get isManaCostFilter {
    _$isManaCostFilterAtom.reportRead();
    return super.isManaCostFilter;
  }

  @override
  set isManaCostFilter(bool value) {
    _$isManaCostFilterAtom.reportWrite(value, super.isManaCostFilter, () {
      super.isManaCostFilter = value;
    });
  }

  late final _$isSearchAtom =
      Atom(name: 'CardControllerBase.isSearch', context: context);

  @override
  bool get isSearch {
    _$isSearchAtom.reportRead();
    return super.isSearch;
  }

  @override
  set isSearch(bool value) {
    _$isSearchAtom.reportWrite(value, super.isSearch, () {
      super.isSearch = value;
    });
  }

  late final _$isTextSearchingAtom =
      Atom(name: 'CardControllerBase.isTextSearching', context: context);

  @override
  String get isTextSearching {
    _$isTextSearchingAtom.reportRead();
    return super.isTextSearching;
  }

  @override
  set isTextSearching(String value) {
    _$isTextSearchingAtom.reportWrite(value, super.isTextSearching, () {
      super.isTextSearching = value;
    });
  }

  late final _$selectedManaColorsAtom =
      Atom(name: 'CardControllerBase.selectedManaColors', context: context);

  @override
  Set<ManaColor> get selectedManaColors {
    _$selectedManaColorsAtom.reportRead();
    return super.selectedManaColors;
  }

  @override
  set selectedManaColors(Set<ManaColor> value) {
    _$selectedManaColorsAtom.reportWrite(value, super.selectedManaColors, () {
      super.selectedManaColors = value;
    });
  }

  late final _$toggleSearchAsyncAction =
      AsyncAction('CardControllerBase.toggleSearch', context: context);

  @override
  Future<dynamic> toggleSearch(String text) {
    return _$toggleSearchAsyncAction.run(() => super.toggleSearch(text));
  }

  late final _$toggleManaCostFilterAsyncAction =
      AsyncAction('CardControllerBase.toggleManaCostFilter', context: context);

  @override
  Future<dynamic> toggleManaCostFilter(Set<ManaColor> selectedColors) {
    return _$toggleManaCostFilterAsyncAction
        .run(() => super.toggleManaCostFilter(selectedColors));
  }

  late final _$toggleFavoritesAsyncAction =
      AsyncAction('CardControllerBase.toggleFavorites', context: context);

  @override
  Future<dynamic> toggleFavorites() {
    return _$toggleFavoritesAsyncAction.run(() => super.toggleFavorites());
  }

  late final _$loadCardsAsyncAction =
      AsyncAction('CardControllerBase.loadCards', context: context);

  @override
  Future<dynamic> loadCards() {
    return _$loadCardsAsyncAction.run(() => super.loadCards());
  }

  @override
  String toString() {
    return '''
loadedCards: ${loadedCards},
isLoading: ${isLoading},
isPaggination: ${isPaggination},
hasError: ${hasError},
currentPage: ${currentPage},
isFavoriteFilter: ${isFavoriteFilter},
cardsToShow: ${cardsToShow},
isManaCostFilter: ${isManaCostFilter},
isSearch: ${isSearch},
isTextSearching: ${isTextSearching},
selectedManaColors: ${selectedManaColors}
    ''';
  }
}
