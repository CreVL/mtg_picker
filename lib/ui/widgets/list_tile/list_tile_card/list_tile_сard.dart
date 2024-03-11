import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/ui/resurces/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';

import '../../../controllers/favorite_controller/favorite_controller.dart';

class ListTileCard extends StatelessWidget {
  final Cards card;
  final VoidCallback onTap;
  final bool isFavorite;

  const ListTileCard({
    super.key,
    required this.onTap,
    required this.card,
    required this.isFavorite,
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
                  card.imageUrl,
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
                    card.manaCost,
                    style: themeData.textTheme.titleSmall,
                  ),
                  Text(
                    card.name,
                    style: themeData.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: AppColors.orange,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 18,
            ),
          ],
        ),
      ),
    );
  }
}
