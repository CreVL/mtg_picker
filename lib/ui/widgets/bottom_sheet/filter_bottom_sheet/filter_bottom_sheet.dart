import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mtg_picker/ui/controllers/filter_bottom_sheet_controller/filter_bottom_sheet_controller.dart';
import 'package:mtg_picker/ui/providers/provider_extension.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';
import 'package:mtg_picker/ui/widgets/bottom_sheet/bottom_sheet_hat.dart';

import 'package:mtg_picker/ui/widgets/button/mana_color_filter_button/mana_color_filter_button.dart';

import '../../../../domain/enums/mana_color.dart';

class FilterBottomSheet extends HookWidget {
  final Function(Set<ManaColor>) filterChanged;

  const FilterBottomSheet({super.key, required this.filterChanged});

  @override
  Widget build(BuildContext context) {
    final filterBottomSheetController =
        context.watch<FilterBottomSheetController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const BottomSheetHat(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Filter Cards',
                    style: themeData.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Observer(
                builder: (_) => Row(
                  children: [
                    Text(
                      'ManaCost:',
                      style: themeData.textTheme.titleLarge,
                    ),
                    const SizedBox(width: 10),
                    ManaColorFilterButton(
                      color: AppColors.whiteMana,
                      isSelected: filterBottomSheetController.whiteManaSelected,
                      onTap: () {
                        filterBottomSheetController.toggleWhiteMana();
                        filterChanged(
                          filterBottomSheetController.selectedColors,
                        );
                      },
                    ),
                    ManaColorFilterButton(
                      color: AppColors.blueMana,
                      isSelected: filterBottomSheetController.blueManaSelected,
                      onTap: () {
                        filterBottomSheetController.toggleBlueMana();
                        filterChanged(
                          filterBottomSheetController.selectedColors,
                        );
                      },
                    ),
                    ManaColorFilterButton(
                      color: AppColors.blackMana,
                      isSelected: filterBottomSheetController.blackManaSelected,
                      onTap: () {
                        filterBottomSheetController.toggleBlackMana();
                        filterChanged(
                          filterBottomSheetController.selectedColors,
                        );
                      },
                    ),
                    ManaColorFilterButton(
                      color: AppColors.redMana,
                      isSelected: filterBottomSheetController.redManaSelected,
                      onTap: () {
                        filterBottomSheetController.toggleRedMana();
                        filterChanged(
                          filterBottomSheetController.selectedColors,
                        );
                      },
                    ),
                    ManaColorFilterButton(
                      color: AppColors.greenMana,
                      isSelected: filterBottomSheetController.greenManaSelected,
                      onTap: () {
                        filterBottomSheetController.toggleGreenMana();
                        filterChanged(
                          filterBottomSheetController.selectedColors,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Observer(
                builder: (_) => Row(
                  children: [
                    Text(
                      "ManaCost count:",
                      style: themeData.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ],
    );
  }
}
