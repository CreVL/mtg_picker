import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../internal/mocks/callable/callable.mocks.dart';
import 'app_bar_search_controller_test.mocks.dart';
import 'app_bar_search_controller_tester.dart';

@GenerateNiceMocks([
  MockSpec<TextEditingController>(),
])
void main() {
  group('app_bar_search_controller tests---', () {
    const String typedString = "nameName";
    late MockCallable<String> searchChangedCallback;
    late AppBarSearchControllerTester controller;
    late TextEditingController textEditingController;
    // late final
    setUp(() {
      searchChangedCallback = MockCallable<String>();
      controller =
          AppBarSearchControllerTester(searchChanged: searchChangedCallback);
      textEditingController = MockTextEditingController();
      controller.textEditingController = textEditingController;
    });

    test('isSearchActivated should be false by default', () {
      //prep data

      //manipulation

      //check
      expect(controller.isSearchActivated, false);
    });

    test('canCleanSearch should be false by default', () {
      //prep data

      //manipulation

      //check
      expect(controller.canCleanSearch, false);
    });
    test('clearSearchField() should set canCleanSearch to false', () {
      //prep data
      controller.canCleanSearch = true;
      //manipulation
      controller.clearSearchField();
      //check
      expect(controller.canCleanSearch, false);
    });
    test('clearSearchField() should call clear() on textEditingController', () {
      //prep data

      //manipulation
      controller.clearSearchField();
      //check
      verify(textEditingController.clear()).called(1);
    });
    test(
        'clearSearchField() should call searchChanged callback with textEditingController.text value',
        () {
      //prep data
      when(textEditingController.text).thenReturn(typedString);
      //manipulation
      controller.clearSearchField();
      //check
      verify(searchChangedCallback(typedString)).called(1);
    });
    test('textUpdated() should call searchChanged callback with passedValue',
        () {
      //prep data

      //manipulation
      controller.textUpdated(typedString);
      //check
      verify(searchChangedCallback(typedString)).called(1);
    });
    test(
        'textUpdated() should set canCleanSearch to textEditingController.text.isNotEmpty result',
        () {
      //prep data
      when(textEditingController.text).thenReturn(typedString);
      final bool expectedValue = textEditingController.text.isNotEmpty;
      //manipulation
      controller.textUpdated(typedString);
      //check
      expect(controller.canCleanSearch, expectedValue);
    });
    test(
        'toggleSearchActivated() should set isSearchActivated to opposite bool value',
        () {
      //prep data
      bool initialValue = controller.isSearchActivated;
      //manipulation
      controller.toggleSearchActivated();
      //check
      expect(controller.isSearchActivated, !initialValue);
    });
    test(
        'toggleSearchActivated() should call controller`s cleanSearchField method if isSearchActivated is false',
        () {
      //prep data
      controller.isSearchActivated = true;
      //manipulation
      controller.toggleSearchActivated();
      //check
      expect(controller.cleanSearchFieldCalled, 1);
    });
    test(
        'toggleSearchActivated() should not call controller`s cleanSearchField method if isSearchActivated is true',
        () {
      //prep data
      controller.isSearchActivated = false;
      //manipulation
      controller.toggleSearchActivated();
      //check
      expect(controller.cleanSearchFieldCalled, 0);
    });
  });
}
