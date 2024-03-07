import 'package:flutter/material.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/ui/resurces/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';

class CardDetailsPage extends StatelessWidget {
  final Cards card;

  const CardDetailsPage({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.brown_0, width: 5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  card.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Описание карты
            Text(
              'Mana Cost: ${card.manaCost}',
              style: themeData.textTheme.titleLarge,
            ),
            Text(
              'Name: ${card.name}',
              style: themeData.textTheme.titleLarge,
            ),
            Text(
              'Type: ${card.type}',
              style: themeData.textTheme.titleLarge,
            ),
            Text(
              'Rarity: ${card.rarity}',
              style: themeData.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
