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
  });
}
