import 'package:flutter/material.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';

class BottomSheetHat extends StatelessWidget {
  const BottomSheetHat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Center(
        child: Container(
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
