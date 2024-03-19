import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/ui/controllers/favorite_controller/favorite_controller.dart';
import 'package:mtg_picker/ui/pages/card_image_view_page/card_image_view_page.dart';
import 'package:mtg_picker/ui/providers/provider_extension.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';

class CardDetailsPage extends StatelessWidget {
  final Cards card;

  const CardDetailsPage({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final favoritesController = context.watch<FavoriteController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          card.name,
          style: themeData.textTheme.titleLarge,
        ),
        actions: [
          Observer(
            builder: (context) {
              final favoriteCard = favoritesController.findFavoriteCard(card);
              final isFavorite = favoriteCard != null;
              return GestureDetector(
                onTap: () {
                  if (isFavorite) {
                    favoritesController.deleteFavoriteCard(favoriteCard.uuid);
                  } else {
                    favoritesController.addFavoriteCard(card);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: AppColors.orange,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardImageViewPage(
                          cardImageUrl: card.imageUrl,
                        ),
                      ),
                    );
                  },
                  child: Container(
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
          ],
        ),
      ),
    );
  }
}
