import 'package:mtg_picker/ui/controllers/app_bar_search_controller/app_bar_search_controller.dart';

class AppBarSearchControllerTester extends AppBarSearchController {
  AppBarSearchControllerTester({required super.searchChanged});
  int cleanSearchFieldCalled = 0;

  @override
  void clearSearchField() {
    super.clearSearchField();
    cleanSearchFieldCalled++;
  }
}
