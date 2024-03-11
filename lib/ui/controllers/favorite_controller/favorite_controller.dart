import 'package:mobx/mobx.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/domain/entities/favorite/favorite_card/favorite_card.dart';

part 'favorite_controller.g.dart';

class FavoriteController = _FavoriteControllerBase with _$FavoriteController;

abstract class _FavoriteControllerBase with Store {
  final FavoriteCardRepository favoriteCardRepository;

  final List<FavoriteCard> placeholderCards = List.filled(
    10,
    const FavoriteCard(
      uuid: "1",
      card: Cards(
        name: 'sdfdfdfdfdf',
        manaCost: 'sfddd',
        type: 'fsddddd',
        rarity: 'sdfffff',
        imageUrl:
            'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card',
      ),
    ),
  );

  _FavoriteControllerBase({
    required this.favoriteCardRepository,
  });

  ObservableList<FavoriteCard> cards = ObservableList();

  @observable
  bool isLoading = false;

  @action
  Future loadFavorites() async {
    isLoading = true;
    final futures = <Future>[];
    futures.add(
      favoriteCardRepository.getFavoriteCards().then((value) {
        if (value.isRight) {
          cards.addAll(value.right!);
        }
      }),
    );
    await Future.wait(futures);
    isLoading = false;
  }

  FavoriteCard? findFavoriteCard(Cards card) {
    return cards.where((element) => element.card.name == card.name).firstOrNull;
  }

  @action
  Future addFavoriteCard(Cards card) async {
    final either = await favoriteCardRepository.createFavoriteCard(card);
    final favoriteCards = either.right;
    if (favoriteCards != null) {
      cards.add(favoriteCards);
    }
  }

  @action
  Future deleteFavoriteCard(String uuid) async {
    final successEither = await favoriteCardRepository.deleteFavoriteCard(uuid);
    final success = successEither.right;
    if (success ?? false) {
      final cardIndex = cards.indexWhere((element) => element.uuid == uuid);
      cards.removeAt(cardIndex);
    }
    return;
  }
}
