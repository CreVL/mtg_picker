import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mtg_picker/ui/resurces/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';

class ListTileCard extends StatelessWidget {
  final String nameCard;
  final String imageCard;
  final String manaCostCard;
  final VoidCallback onTap;

  const ListTileCard({
    super.key,
    required this.nameCard,
    required this.imageCard,
    required this.manaCostCard,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 200.0,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.brown_0, width: 3),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageCard,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    manaCostCard,
                    style: themeData.textTheme.titleSmall,
                  ),
                  Text(
                    nameCard,
                    style: themeData.textTheme.titleLarge,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
