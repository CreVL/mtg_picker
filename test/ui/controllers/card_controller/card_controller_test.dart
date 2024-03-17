import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/application/repository/repository_error.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
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
    late MockCardController cardController;

    setUp(() {
      cardsRepository = MockCardsRepository();
      favoriteCardRepository = MockFavoriteCardRepository();
      cardController =
          MockCardController(cardsRepository, favoriteCardRepository);
    });

    test('getCards() should set hasError to true on error', () async {
      //prep data
      final errorResult = MockRepositoryError();
      when(cardsRepository.getCards())
          .thenAnswer((_) async => Either.left(errorResult));
      //manipulation
      await cardController.loadCards();
      //check
      expect(cardController.hasError, true);
    });
    test(
        'loadMoreCards() should increment the currentPage at the end of the scroll',
        () async {
      //prep data
      final page = cardController.currentPage;
      final mockedCards = [MockCards()];
      final result = mockedCards;
      when(cardsRepository.getCards(page: anyNamed('page')))
          .thenAnswer((_) async => Either.right(result));
      //manipulation
      await cardController.loadMoreCards();
      //check
      expect(cardController.currentPage, page + 1);
    });
    test('loadCards() should set isLoading to true, then to false', () async {
      //prep data
      final callable = MockCallable();
      mobx.reaction(
        (p0) => cardController.isLoading,
        (p0) => callable.call(p0),
      );
      final mockedCards = [MockCards()];
      final result = mockedCards;
      when(cardsRepository.getCards())
          .thenAnswer((_) async => Either.right(result));
      //manipulation
      await cardController.loadCards();
      //check
      verifyInOrder([callable.call(true), callable.call(false)]);
    });
    test(
        'filterCardsByNameSearch() should filter loadedCards() with passed string'
        'and set filtered value to cardsToShow field', () async {
      //prep data
      final card1 = MockCards();
      final card2 = MockCards();
      final card3 = MockCards();
      when(card1.name).thenReturn('name test 1');
      when(card2.name).thenReturn('name test 2');
      when(card3.name).thenReturn('name test 3');
      cardController.loadedCards =
          mobx.ObservableList.of([card1, card2, card3]);
      //manipulation
      cardController.filterCardsByNameSearch('name test 2');
      //check
      expect(cardController.cardsToShow, containsAll([card2]));
    });
    test('toggleFavoritesFilter() should call buildCardsDependOnFilter()',
        () async {
      //prep data
      const isFiltered = true;
      cardController.isFavoriteFilter = isFiltered;
      //manipulation
      await cardController.toggleFavorites();
      //check
      expect(cardController.buildCardsDependOnFilterCalled, 1);
    });
    test(
        'buildCardsDependOnFilter() should set isFiltered to false when FavoriteCardRepository.getFavoriteCards() is error',
        () async {
      //prep data
      final errorResult = MockRepositoryError();
      when(favoriteCardRepository.getFavoriteCards())
          .thenAnswer((_) async => Either.left(errorResult));
      //manipulation
      await cardController.buildCardsDependOnFilterFavorite();
      //check
      expect(cardController.isFavoriteFilter, false);
    });
  });
}
