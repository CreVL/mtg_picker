import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/application/repository/repository_error.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/domain/entities/favorite/favorite_card/favorite_card.dart';
import 'package:mtg_picker/internal/entities/either.dart';
import 'package:mtg_picker/ui/controllers/favorite_controller/favorite_controller.dart';

@GenerateNiceMocks([
  MockSpec<RepositoryError>(),
  MockSpec<FavoriteCardRepository>(),
  MockSpec<FavoriteCard>(),
  MockSpec<Cards>(),
])
import 'favorite_controller_test.mocks.dart';

void main() {
  group('favorite_controller tests---', () {
    late FavoriteController controller;
    late MockFavoriteCardRepository favoriteCardRepository;

    const delay = Duration(seconds: 1);
    MockFavoriteCard card = MockFavoriteCard();
    const cardUuid = "1";
    when(card.uuid).thenReturn(cardUuid);
    setUp(() {
      favoriteCardRepository = MockFavoriteCardRepository();

      when(favoriteCardRepository.getFavoriteCards()).thenAnswer(
        (_) async {
          await Future.delayed(delay);
          return Either.right([card]);
        },
      );
      controller = FavoriteController(
        favoriteCardRepository: favoriteCardRepository,
      );
    });

    test('loadFavorites should set isLoading to true when started loading', () {
      //prep data

      //manipulation
      fakeAsync((async) {
        controller.loadFavorites();
      });
      //check
      expect(controller.isLoading, true);
    });

    test('loadFavorites should set isLoading to false when finished loading',
        () {
      //prep data

      //manipulation
      fakeAsync((async) {
        controller.loadFavorites();
        async.elapse(delay);
      });
      //check
      expect(controller.isLoading, false);
    });

    test(
        'loadFavorites should set cards from FavoriteCardRepository.getFavoriteCards',
        () {
      //prep data

      //manipulation
      fakeAsync((async) {
        controller.loadFavorites();
        async.elapse(delay);
      });
      //check
      expect(controller.cards, [card]);
    });

    test(
        'findFavoriteCard should return favoriteCard from cards that has the same name as passed card',
        () {
      //prep data
      const cardName = 'cardName';
      final mockFavoriteCard = MockFavoriteCard();
      final mockCard = MockCards();
      when(mockFavoriteCard.card).thenReturn(mockCard);
      when(mockCard.name).thenReturn(cardName);
      controller.cards = mobx.ObservableList.of([mockFavoriteCard]);
      //manipulation
      final result = controller.findFavoriteCard(mockCard);
      //check
      expect(result, mockFavoriteCard);
    });

    test(
        'deleteFavoriteCard should call FavoriteCardRepository.deleteFavoriteCard and remove card if result is true',
        () async {
      //prep data
      when(favoriteCardRepository.deleteFavoriteCard(cardUuid))
          .thenAnswer((_) async => Either.right(true));
      //manipulation
      fakeAsync((async) {
        controller.loadFavorites();
        async.elapse(delay);
      });
      await controller.deleteFavoriteCard(cardUuid);
      //check
      verify(favoriteCardRepository.deleteFavoriteCard(cardUuid));
      expect(controller.cards, []);
    });

    test(
        "deleteFavoriteCard should call FavoriteCardRepository.deleteFavoriteCard and don't remove card if result is false",
        () async {
      //prep data
      when(favoriteCardRepository.deleteFavoriteCard(cardUuid))
          .thenAnswer((_) async => Either.right(false));
      //manipulation
      fakeAsync((async) {
        controller.loadFavorites();
        async.elapse(delay);
      });
      await controller.deleteFavoriteCard(cardUuid);
      //check
      verify(favoriteCardRepository.deleteFavoriteCard(cardUuid));
      expect(controller.cards, [card]);
    });

    test(
        "addFavoriteCard should call FavoriteCardRepository.createFavoriteCard with card",
        () async {
      //prep data
      final mockFavoriteCard = MockFavoriteCard();
      final mockCard = MockCards();
      when(
        favoriteCardRepository.createFavoriteCard(mockCard),
      ).thenAnswer((_) async => Either.right(mockFavoriteCard));
      //manipulation
      fakeAsync((async) {
        controller.loadFavorites();
        async.elapse(delay);
      });
      await controller.addFavoriteCard(mockCard);
      //check
      verify(favoriteCardRepository.createFavoriteCard(mockCard)).called(1);
    });

    test(
        "addFavoriteCard should add created favoriteCard to cards if FavoriteCardRepository.createFavoriteCard return",
        () async {
      //prep data
      final mockFavoriteCard = MockFavoriteCard();
      final mockCard = MockCards();
      when(
        favoriteCardRepository.createFavoriteCard(mockCard),
      ).thenAnswer((_) async => Either.right(mockFavoriteCard));
      //manipulation
      fakeAsync((async) {
        controller.loadFavorites();
        async.elapse(delay);
      });
      await controller.addFavoriteCard(mockCard);
      //check
      expect(controller.cards, contains(mockFavoriteCard));
    });
  });
}
