import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';

part 'card_controller.g.dart';

class CardController = CardControllerBase with _$CardController;

abstract class CardControllerBase with Store {
  final CardsRepository cardsRepository;

  final ScrollController scrollController = ScrollController();

  CardControllerBase(this.cardsRepository) {
    scrollController.addListener(_scrolling);
  }

  void _scrolling() {
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      loadMoreCards();
    }
  }

  @observable
  ObservableList<Cards> cards = ObservableList<Cards>();

  @observable
  ObservableList<Cards> savedCards = ObservableList<Cards>();

  @observable
  bool isLoading = false;

  @observable
  bool hasError = false;

  @observable
  int currentPage = 1;

  @action
  Future<void> loadCards() async {
    isLoading = true;
    final eitherResult = await cardsRepository.getCards();
    if (eitherResult.isLeft) {
      hasError = true;
    } else if (eitherResult.isRight) {
      hasError = false;
      cards.addAll(eitherResult.right!);
      savedCards = ObservableList.of(eitherResult.right!);
    }
    isLoading = false;
  }

  @action
  Future<void> loadMoreCards() async {
    currentPage++;
    final eitherResult = await cardsRepository.getCards(page: currentPage);
    if (eitherResult.isRight) {
      hasError = false;
      cards.addAll(eitherResult.right!);
      savedCards.addAll(eitherResult.right!);
    } else {
      hasError = true;
    }
  }

  @action
  void filterCardsByNameContains(String text) {
    if (text.isEmpty || text.trim().isEmpty) {
      cards = ObservableList.of(savedCards);
    } else {
      cards = ObservableList.of(
        savedCards
            .where(
              (card) => card.name.toLowerCase().contains(text.toLowerCase()),
            )
            .toList(),
      );
    }
  }
}
