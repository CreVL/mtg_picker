import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mtg_picker/ui/resurces/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';

class ListTileCard extends StatelessWidget {
  final String title;
  final String? image;
  final String? typeCard;
  final String? manaCostCard;

  const ListTileCard({
    super.key,
    required this.title,
    required this.image,
    required this.typeCard,
    required this.manaCostCard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {},
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
                  '$image',
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
                    manaCostCard!,
                    style: themeData.textTheme.titleSmall,
                  ),
                  Text(
                    title,
                    style: themeData.textTheme.titleLarge,
                  ),
                  Text(
                    typeCard!,
                    style: themeData.textTheme.titleMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
