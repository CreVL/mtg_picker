import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mtg_picker/domain/enums/mana_color.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';
import '../../../internal/mocks/callable/callable.mocks.dart';
import 'filter_bottom_sheet_controller_tester.dart';

@GenerateNiceMocks([
  MockSpec<Set<ManaColor>>(),
])
void main() {
  group('filter_bottom_sheet_controller tests---', () {
    late Function(Set<ManaColor>) filterChangedCallback;
    late FilterBottomSheetControllerTester controller;

    setUp(() {
      filterChangedCallback = MockCallable<Set<ManaColor>>().call;
      controller = FilterBottomSheetControllerTester(
        filterChanged: filterChangedCallback,
      );
    });
    test('whiteManaSelected should be false by default', () {
      //prep data

      //manipulation

      //check
      expect(controller.whiteManaSelected, false);
    });

    test('blueManaSelected should be false by default', () {
      //prep data

      //manipulation

      //check
      expect(controller.blueManaSelected, false);
    });

    test('isFilterActivated should be false by default', () {
      //prep data

      //manipulation

      //check
      expect(controller.isFilterActivated, false);
    });

    test('blackManaSelected should be false by default', () {
      //prep data

      //manipulation

      //check
      expect(controller.blackManaSelected, false);
    });

    test('redManaSelected should be false by default', () {
      //prep data

      //manipulation

      //check
      expect(controller.redManaSelected, false);
    });

    test('greenManaSelected should be false by default', () {
      //prep data

      //manipulation

      //check
      expect(controller.greenManaSelected, false);
    });

    test('toggleWhiteMana() should toggle whiteManaSelected and update filters',
        () {
      //prep data
      final initValue = controller.whiteManaSelected;
      //manipulation
      controller.toggleWhiteMana();
      //check
      expect(controller.whiteManaSelected, !initValue);
    });

    test('toggleBlueMana() should toggle blueManaSelected and update filters',
        () {
      //prep data
      final initValue = controller.blueManaSelected;
      //manipulation
      controller.toggleBlueMana();
      //check
      expect(controller.blueManaSelected, !initValue);
    });

    test('toggleBlackMana() should toggle blackManaSelected and update filters',
        () {
      //prep data
      final initValue = controller.blackManaSelected;
      //manipulation
      controller.toggleBlackMana();
      //check
      expect(controller.blackManaSelected, !initValue);
    });

    test('toggleRedMana() should toggle redManaSelected and update filters',
        () {
      //prep data
      final initValue = controller.redManaSelected;
      //manipulation
      controller.toggleRedMana();
      //check
      expect(controller.redManaSelected, !initValue);
    });

    test('toggleGreenMana() should toggle greenManaSelected and update filters',
        () {
      //prep data
      final initValue = controller.greenManaSelected;
      //manipulation
      controller.toggleGreenMana();
      //check
      expect(controller.greenManaSelected, !initValue);
    });

    test('updateFilters should update selectedColors witch result', () {
      //prep data
      controller.whiteManaSelected = false;
      controller.redManaSelected = true;
      //manipulation
      controller.updateFilters();
      //check
      expect(controller.selectedColors.contains(ManaColor.manaWhite), false);
      expect(controller.selectedColors.contains(ManaColor.manaRed), true);
    });
  });
}
