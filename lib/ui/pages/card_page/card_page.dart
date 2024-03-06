import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/ui/resurces/app_colors.dart';
import 'package:mtg_picker/ui/state_managment/card_controller/card_controller.dart';
import 'package:mtg_picker/ui/widgets/list_tile_сard.dart';

class CardPage extends HookWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
      () => CardController(GetIt.I<CardsRepository>()),
    );

    useEffect(() {
      controller.loadCards();
    });

    return Observer(
      builder: (_) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
            controller: controller.scrollController,
            itemCount: controller.cards.length + 1,
            itemBuilder: (context, index) {
              if (index < controller.cards.length) {
                final card = controller.cards[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ListTileCard(
                    nameCard: card.name,
                    imageCard: card.imageUrl,
                    manaCostCard: card.manaCost,
                    typeCard: card.type,
                    rarityCard: card.rarity,
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 2,
                color: AppColors.brown_0,
              );
            },
          );
        }
      },
    );
  }
}
