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
  ObservableList<Cards>? cardsToShow;

  @observable
  ObservableList<Cards>? loadedCards;

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
      loadedCards = eitherResult.right?.asObservable();
      cardsToShow = loadedCards;
    }

    isLoading = false;
  }

  @action
  Future<void> loadMoreCards() async {
    currentPage++;

    final eitherResult = await cardsRepository.getCards(
      page: currentPage,
    );

    if (eitherResult.isRight) {
      hasError = false;
      final loadedCards = eitherResult.right!;
      cardsToShow?.addAll(loadedCards);
    }
  }

  @action
  void filterCardsByNameContains(String text) {
    if (text.isEmpty || text.trim().isEmpty) {
      cardsToShow = loadedCards;
    } else {
      cardsToShow = loadedCards!
          .where(
            (card) => card.name.toLowerCase().contains(
                  text.toLowerCase(),
                ),
          )
          .toList()
          .asObservable();
    }
  }

  final List<Cards> mockedCards = [
    const Cards(
        name: 'Eleito da Ancestral',
        manaCost: '{5}{W}{W}',
        type: 'Creature — Human Cleric',
        rarity: 'Uncommon',
        imageUrl:
            'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=148411&type=card'),
    const Cards(
        name: 'Spirit Link',
        manaCost: '{W}',
        type: 'Kreatur — Enge',
        rarity: 'Common',
        imageUrl:
            'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=149934&type=card'),
    const Cards(
        name: 'Dia Sagrado',
        manaCost: '{2}{W}',
        type: 'Enchantment — Aura',
        rarity: 'Rare',
        imageUrl:
            'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=149551&type=card'),
  ];
}
