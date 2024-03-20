import 'package:mtg_picker/ui/state_management/card_controller/card_controller.dart';

class MockCardControllerTester extends CardController {
  MockCardControllerTester(
    super.cardsRepository,
    super.favoriteCardRepository,
  );

  int applyFiltersCalled = 0;

  @override
  Future<void> loadCards() async {
    applyFiltersCalled += 1;
  }

  @override
  Future<void> applyFilters() async {
    applyFiltersCalled += 1;
  }
}
