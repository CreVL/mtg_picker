import 'package:flutter/material.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';

class FavoriteToggleChip extends StatelessWidget {
  final bool isSelected;
  final IconData Function(bool isSelected) iconBuilder;
  final Function()? onTap;

  const FavoriteToggleChip({
    super.key,
    required this.iconBuilder,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconBuilder(isSelected),
            color: AppColors.orange,
          ),
        ],
      ),
    );
  }
}
