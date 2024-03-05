import 'package:mobx/mobx.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';

part 'card_controller.g.dart';

class CardController = CardControllerBase with _$CardController;

abstract class CardControllerBase with Store {
  final CardsRepository cardsRepository;

  CardControllerBase(this.cardsRepository);

  @observable
  List<Card>? cards;

  @observable
  ObservableList<Card> loadedCards = ObservableList<Card>();

  @observable
  bool isLoading = false;

  @observable
  int currentPage = 1;

  @action
  Future<void> loadCards() async {
    isLoading = true;
    final res = await cardsRepository.getCards();
    cards = res;
    isLoading = false;
  }

  @action
  Future<void> loadMoreCards() async {
    currentPage++;
    final res = await cardsRepository.getCards(page: currentPage);
    loadedCards.addAll(res);
  }
}
