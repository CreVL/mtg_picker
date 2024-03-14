import 'package:mtg_picker/ui/controllers/filter_bottom_sheet_controller/filter_bottom_sheet_controller.dart';

class FilterBottomSheetControllerTester extends FilterBottomSheetController {
  FilterBottomSheetControllerTester({required super.filterChanged});
  int updateFiltersCalled = 0;

  @override
  void updateFilters() {
    super.updateFilters();
    updateFiltersCalled++;
  }
}
