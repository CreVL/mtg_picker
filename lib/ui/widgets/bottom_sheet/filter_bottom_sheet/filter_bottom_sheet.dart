import 'package:flutter/material.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';
import 'package:mtg_picker/ui/widgets/bottom_sheet/bottom_sheet_hat.dart';

class FilterBottomSheet extends StatelessWidget {
  final Function(Color color)? filterChanged;

  const FilterBottomSheet({super.key, this.filterChanged});

  @override
  Widget build(BuildContext context) {
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      color: AppColors.orange,
                      Icons.close,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    'ManaCost:' ,
                    style: themeData.textTheme.titleLarge,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ],
    );
  }
}
