import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';

import '../../../domain/enums/mana_color.dart';

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
    if (isPagination &&
        !isLoading &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
      loadMoreCards();
    }
  }

  @observable
  ObservableList<Cards>? loadedCards;

  @observable
  bool isLoading = false;

  @observable
  bool isPagination = true;

  @observable
  bool hasError = false;

  @observable
  int currentPage = 1;

  @observable
  bool isFavoriteFilter = false;

  @observable
  ObservableList<Cards>? cardsToShow;

  @observable
  bool isManaCostFilter = false;

  @observable
  bool isSearch = false;

  @observable
  String isTextSearching = '';

  @observable
  Set<ManaColor> selectedManaColors = {};

  final Map<ManaColor, String> manaColors = {
    ManaColor.manaWhite: 'W',
    ManaColor.manaBlue: 'U',
    ManaColor.manaBlack: 'B',
    ManaColor.manaRed: 'R',
    ManaColor.manaGreen: 'G',
  };

  @action
  Future loadMoreCards() async {
    currentPage++;
    final eitherResult = await cardsRepository.getCards(page: currentPage);
    if (eitherResult.isRight) {
      final newCards = eitherResult.right?.asObservable();
      if (isPagination) {
        loadedCards?.addAll(newCards!);
        await applyFilters();
      }
    }
  }

  @action
  Future loadCards() async {
    isLoading = true;
    final eitherResult = await cardsRepository.getCards(page: currentPage);
    if (eitherResult.isLeft) {
      hasError = true;
    } else if (eitherResult.isRight) {
      hasError = false;
      loadedCards = eitherResult.right?.asObservable();
      await applyFilters();
    }
    isLoading = false;
  }

  @action
  Future toggleSearch(String text) async {
    isTextSearching = text;
    isSearch = text.isNotEmpty;
    await applyFilters();
  }

  @action
  Future toggleManaCostFilter(Set<ManaColor> selectedColors) async {
    isManaCostFilter = selectedColors.isNotEmpty;
    selectedManaColors = selectedColors;
    await applyFilters();
  }

  @action
  Future toggleFavorites() async {
    isFavoriteFilter = !isFavoriteFilter;
    isPagination = !isSearch && !isFavoriteFilter;
    await applyFilters();
  }

  Future applyFilters() async {
    var filteredCards = ObservableList.of(loadedCards!);

    if (isFavoriteFilter) {
      filteredCards =
          ObservableList.of(await filterFavoriteCards(filteredCards));
    }

    if (isTextSearching.isNotEmpty && isTextSearching.trim().isNotEmpty) {
      filteredCards = ObservableList.of(
        filteredCards.where(
          (card) =>
              card.name.toLowerCase().contains(isTextSearching.toLowerCase()),
        ),
      );
    }

    if (isManaCostFilter) {
      filteredCards = ObservableList.of(await filterByManaCost(filteredCards));
    }

    cardsToShow = filteredCards;

    if (filteredCards.isNotEmpty &&
        filteredCards.length > loadedCards!.length) {
      cardsToShow = filteredCards;
    } else {
      loadMoreCards();
    }
  }

  Future<List<Cards>> filterFavoriteCards(List<Cards> cards) async {
    final favoriteCardsResult = await favoriteCardRepository.getFavoriteCards();
    return favoriteCardsResult.resolve(
      (error) {
        return [];
      },
      (favoriteCards) {
        return favoriteCards.map((favorite) => favorite.card).toList();
      },
    );
  }

  Future<List<Cards>> filterByManaCost(List<Cards> cards) async {
    return cards.where((card) {
      if (selectedManaColors.isEmpty) {
        return true;
      }
      for (var selectedColor in selectedManaColors) {
        if (!card.manaCost.contains(getStringMana(selectedColor))) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  String getStringMana(ManaColor color) {
    return manaColors[color] ?? "";
  }

  final List<Cards> mockedCards = [
    const Cards(
      name: 'Eleito da Ancestral',
      manaCost: '{5}{W}{W}',
      type: 'Creature — Human Cleric',
      rarity: 'Uncommon',
      imageUrl:
          'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=148411&type=card',
    ),
    const Cards(
      name: 'Spirit Link',
      manaCost: '{W}',
      type: 'Kreatur — Enge',
      rarity: 'Rare',
      imageUrl:
          'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=149934&type=card',
    ),
    const Cards(
      name: 'Predatore Solcacielo',
      manaCost: '{2}{W}',
      type: 'Enchantment — Aura',
      rarity: 'Common',
      imageUrl:
          'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=149551&type=card',
    ),
  ];
}
