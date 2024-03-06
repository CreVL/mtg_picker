import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/repository_error.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/internal/entities/either.dart';
import 'package:mtg_picker/ui/state_managment/card_controller/card_controller.dart';

import '../../../internal/mocks/callable/callable.mocks.dart';
@GenerateNiceMocks([
  MockSpec<CardsRepository>(),
  MockSpec<Either<RepositoryError, List<Cards>>>(),
  MockSpec<RepositoryError>(),
  MockSpec<Cards>(),
])
import 'card_controller_test.mocks.dart';

void main() {
  group('card_controller tests---', () {
    late MockCardsRepository cardsRepository;
    late CardController cardController;

    setUp(() {
      cardsRepository = MockCardsRepository();
      cardController = CardController(cardsRepository);
    });

    test('getCards should set hasError to true on error', () async {
      //prep data
      final errorResult = MockRepositoryError();
      when(cardsRepository.getCards())
          .thenAnswer((_) async => Either.left(errorResult));
      //manipulation
      await cardController.loadCards();
      //check
      expect(cardController.hasError, true);
    });

    test('loadMoreCards should increment the page at the end of the scroll',
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

    test('loadCards should set isLoading to true, then to false', () async {
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
  });
}
