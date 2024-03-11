// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteController on _FavoriteControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_FavoriteControllerBase.isLoading', context: context);

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

  late final _$loadFavoritesAsyncAction =
      AsyncAction('_FavoriteControllerBase.loadFavorites', context: context);

  @override
  Future<dynamic> loadFavorites() {
    return _$loadFavoritesAsyncAction.run(() => super.loadFavorites());
  }

  late final _$addFavoriteCardAsyncAction =
      AsyncAction('_FavoriteControllerBase.addFavoriteCard', context: context);

  @override
  Future<dynamic> addFavoriteCard(Cards card) {
    return _$addFavoriteCardAsyncAction.run(() => super.addFavoriteCard(card));
  }

  late final _$deleteFavoriteCardAsyncAction = AsyncAction(
      '_FavoriteControllerBase.deleteFavoriteCard',
      context: context);

  @override
  Future<dynamic> deleteFavoriteCard(String uuid) {
    return _$deleteFavoriteCardAsyncAction
        .run(() => super.deleteFavoriteCard(uuid));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
