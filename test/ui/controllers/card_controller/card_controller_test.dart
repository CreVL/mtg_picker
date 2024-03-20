import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/application/repository/repository_error.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/domain/enums/mana_color.dart';
import 'package:mtg_picker/internal/entities/either.dart';

import '../../../internal/mocks/callable/callable.mocks.dart';
@GenerateNiceMocks([
  MockSpec<CardsRepository>(),
  MockSpec<Either<RepositoryError, List<Cards>>>(),
  MockSpec<RepositoryError>(),
  MockSpec<Cards>(),
  MockSpec<FavoriteCardRepository>(),
])
import 'card_controller_test.mocks.dart';
import 'card_controller_tester.dart';

void main() {
  group('card_controller tests---', () {
    late MockCardsRepository cardsRepository;
    late MockFavoriteCardRepository favoriteCardRepository;
    late MockCardControllerTester cardController;
    setUp(() {
      cardsRepository = MockCardsRepository();
      favoriteCardRepository = MockFavoriteCardRepository();
      cardController =
          MockCardControllerTester(cardsRepository, favoriteCardRepository);
    });
    test('toggleSearch() should call applyFilters()', () async {
      //prep data

      //manipulation
      await cardController.toggleSearch('text');
      //check
      expect(cardController.applyFiltersCalled, 1);
    });
    test('toggleFavorites() should call applyFilters()', () async {
      //prep data
      const isFavoriteFilter = true;
      cardController.isFavoriteFilter = isFavoriteFilter;
      //manipulation
      await cardController.toggleFavorites();
      //check
      expect(cardController.applyFiltersCalled, 1);
    });
    test('toggleManaCostFilter() should call applyFilters()', () async {
      //prep data
      Set<ManaColor> selectedManaColors = {ManaColor.manaRed};
      //manipulation
      await cardController.toggleManaCostFilter(selectedManaColors);
      //check
      expect(cardController.applyFiltersCalled, 1);
    });
    test('toggleManaCountSort() should call applyFilters()', () async {
      //prep data

      //manipulation
      await cardController.toggleManaCountSort();
      //check
      expect(cardController.applyFiltersCalled, 1);
    });
    test('toggleFavorites() should toggle isFavoriteFilter to true, then false',
        () async {
      //prep data
      when(favoriteCardRepository.getFavoriteCards())
          .thenAnswer((_) async => Either.right([]));
      final callable = MockCallable();
      mobx.reaction(
        (p0) => cardController.isFavoriteFilter,
        (p0) => callable(p0),
      );
      //manipulation
      await cardController.toggleFavorites();
      await cardController.toggleFavorites();
      //check
      verifyInOrder([
        callable(true),
        callable(false),
      ]);
    });
    test('loadCards() should update loadedCards', () async {
      //prep data
      final List<Cards> mockCards = [];
      when(cardsRepository.getCards())
          .thenAnswer((_) async => Either.right(mockCards));
      //manipulation
      await cardController.loadCards();
      //check
      expect(cardController.loadedCards, mockCards);
    });
    test('loadMoreCards() should call applyFilters()', () async {
      //prep data
      bool isPagination = true;
      final List<Cards> mockCards = [];
      cardController.isPagination = isPagination;
      when(cardsRepository.getCards(page: anyNamed('page')))
          .thenAnswer((_) async => Either.right(mockCards));
      //manipulation
      await cardController.loadMoreCards();
      //check
      expect(cardController.applyFiltersCalled, 1);
    });
    test('loadCards() should call applyFilters()', () async {
      //prep data
      bool isPagination = true;
      final List<Cards> mockCards = [];
      cardController.isPagination = isPagination;
      when(cardsRepository.getCards(page: anyNamed('page')))
          .thenAnswer((_) async => Either.right(mockCards));
      //manipulation
      await cardController.loadCards();
      //check
      expect(cardController.applyFiltersCalled, 1);
    });
  });
}
