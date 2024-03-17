import 'package:mtg_picker/ui/state_management/card_controller/card_controller.dart';

class MockCardController extends CardController {
  MockCardController(
    super.cardsRepository,
    super.favoriteCardRepository,
  );

  int buildCardsDependOnFilterCalled = 0;
  int loadCardsCalled = 0;

  @override
  Future<void> loadCards() async {
    loadCardsCalled += 1;
    return super.loadCards();
  }

  @override
  Future<void> buildCardsDependOnFilterFavorite() async {
    buildCardsDependOnFilterCalled += 1;
    return super.buildCardsDependOnFilterFavorite();
  }
}
