import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/internal/hooks/effect_once_hook.dart';
import 'package:mtg_picker/ui/controllers/favorite_controller/favorite_controller.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';
import 'package:mtg_picker/ui/widgets/chip/favorite_toggle_chip/favorite_toggle_chip.dart';

class ListTileCard extends HookWidget {
  final Cards card;
  final VoidCallback onTap;
  final bool? isFavorite;

  const ListTileCard({
    super.key,
    required this.onTap,
    required this.card,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesController = useMemoized(
      () => FavoriteController(
        favoriteCardRepository: GetIt.I<FavoriteCardRepository>(),
      ),
    );

    useEffectOnce(() => favoritesController.loadFavorites());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
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
            Observer(
              builder: (context) {
                final favoriteCard = favoritesController.findFavoriteCard(card);
                final isFavorite = favoriteCard != null;
                return FavoriteToggleChip(
                  onTap: () {
                    if (isFavorite) {
                      favoritesController.deleteFavoriteCard(favoriteCard.uuid);
                    } else {
                      favoritesController.addFavoriteCard(card);
                    }
                  },
                  isSelected: isFavorite,
                  iconBuilder: (isSelected) => isSelected
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                );
              },
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
