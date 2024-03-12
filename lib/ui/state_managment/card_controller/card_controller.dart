import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';

part 'card_controller.g.dart';

class CardController = CardControllerBase with _$CardController;

abstract class CardControllerBase with Store {
  final CardsRepository cardsRepository;
  final FavoriteCardRepository favoriteCardRepository;

  final ScrollController scrollController = ScrollController();

  CardControllerBase(
    this.cardsRepository,
    this.favoriteCardRepository,
  ) {
    scrollController.addListener(_scrolling);
  }

  void _scrolling() {
    if (isLoadingMore &&
        scrollController.offset == scrollController.position.maxScrollExtent) {
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
  bool isLoadingMore = true;

  @observable
  bool hasError = false;

  @observable
  bool isFiltered = false;

  @observable
  int currentPage = 1;

  @observable
  bool isSearching = false;

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
    final eitherResult = await cardsRepository.getCards(page: currentPage);
    if (eitherResult.isRight) {
      final newCards = eitherResult.right?.asObservable();
      if (isLoadingMore == true) {
        loadedCards?.addAll(newCards!);
        cardsToShow = loadedCards;
      }
    }
  }

  @action
  void filterCardsByNameContains(String text) {
    isSearching = text.isNotEmpty;
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
    isLoadingMore = !isSearching;
  }

  @action
  Future<void> toggleFavoritesFilter() async {
    isLoadingMore = false;
    isFiltered = !isFiltered;
    await buildCardsDependOnFilter();
  }

  @action
  Future<void> buildCardsDependOnFilter() async {
    if (isFiltered) {
      final favoriteCardsResult =
          await favoriteCardRepository.getFavoriteCards();
      favoriteCardsResult.resolve(
        (error) {},
        (favoriteCards) {
          final favoriteIds =
              favoriteCards.map((favorite) => favorite.card.name).toSet();
          cardsToShow = loadedCards!
              .where((card) => favoriteIds.contains(card.name))
              .toList()
              .asObservable();
        },
      );
    } else {
      cardsToShow = loadedCards;
      isLoadingMore = true;
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
        rarity: 'Rare',
        imageUrl:
            'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=149934&type=card'),
    const Cards(
        name: 'Predatore Solcacielo',
        manaCost: '{2}{W}',
        type: 'Enchantment — Aura',
        rarity: 'Common',
        imageUrl:
            'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=149551&type=card'),
  ];
}
