import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';

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

  @observable
  bool isColorFiltered = false;

  @observable
  Set<Color> selectedManaColors = {};

  final Map<String, Color> manaColors = {
    'W': AppColors.whiteMana,
    'U': AppColors.blueMana,
    'B': AppColors.blackMana,
    'R': AppColors.redMana,
    'G': AppColors.greenMana,
  };

  @action
  void filterCardsByNameSearch(String text) {
    isSearching = text.isNotEmpty;
    if (text.isEmpty || text.trim().isEmpty) {
      filterManaColorSearch();
    } else {
      cardsToShow = loadedCards!
          .where(
            (card) => card.name.toLowerCase().contains(text.toLowerCase()),
          )
          .toList()
          .asObservable();
      filterManaColorSearch();
    }
    isLoadingMore = !isSearching;
  }

  void filterManaColorSearch() {
    if (isColorFiltered) {
      cardsToShow = ObservableList.of(
        cardsToShow!.where((card) {
          for (var manaString in card.manaCost.characters) {
            if (selectedManaColors.contains(manaColors[manaString])) {
              return true;
            }
          }
          return false;
        }),
      );
    }
  }

  @action
  void filterCardsByManaColor(Set<Color> selectedColors) {
    selectedManaColors = selectedColors;
    cardsToShow = ObservableList.of(
      loadedCards!.where((card) {
        if (selectedManaColors.isEmpty) {
          isColorFiltered = false;
          return true;
        }
        for (var manaString in card.manaCost.characters) {
          if (selectedManaColors.contains(manaColors[manaString])) {
            isColorFiltered = true;
            return true;
          }
        }
        isColorFiltered = true;
        return false;
      }),
    );
  }

  @action
  Future loadCards() async {
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
  Future loadMoreCards() async {
    currentPage++;
    final eitherResult = await cardsRepository.getCards(page: currentPage);
    if (eitherResult.isRight) {
      final newCards = eitherResult.right?.asObservable();
      if (isLoadingMore) {
        loadedCards?.addAll(newCards!);
        cardsToShow = loadedCards;
      }
    }
  }

  @action
  Future toggleFavoritesFilter() async {
    isLoadingMore = isFiltered;
    isFiltered = !isFiltered;
    await buildCardsDependOnFilter();
  }

  @action
  Future buildCardsDependOnFilter() async {
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
