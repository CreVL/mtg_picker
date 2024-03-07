import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/ui/pages/card_details_page/card_details_page.dart';
import 'package:mtg_picker/ui/resurces/app_colors.dart';
import 'package:mtg_picker/ui/state_managment/card_controller/card_controller.dart';
import 'package:mtg_picker/ui/theme/theme.dart';
import 'package:mtg_picker/ui/widgets/app_bar/app_bar_search.dart';
import 'package:mtg_picker/ui/widgets/list_tile_сard.dart';

class CardPage extends HookWidget {
  const CardPage({super.key});

  static const double _navbarHeight = 72;

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
      () => CardController(GetIt.I<CardsRepository>()),
    );
    final mediaQueryData = MediaQuery.of(context);
    final viewInsets = mediaQueryData.viewInsets;
    useEffect(() {
      controller.loadCards();
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Builder(builder: (context) {
          return Observer(
            builder: (_) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  viewInsets: viewInsets.copyWith(
                    bottom: max(viewInsets.bottom - _navbarHeight, 0),
                  ),
                ),
                child: Column(
                  children: [
                    AppBarSearch(
                      searchChanged: controller.filterCardsByNameContains,
                      title: Text(
                        'Cards',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: themeData.textTheme.titleLarge,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        controller: controller.scrollController,
                        itemCount: controller.cards.length + 1,
                        itemBuilder: (context, index) {
                          if (index < controller.cards.length) {
                            final card = controller.cards[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: ListTileCard(
                                key: ValueKey(card.name),
                                nameCard: card.name,
                                imageCard: card.imageUrl,
                                manaCostCard: card.manaCost,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CardDetailsPage(card: card),
                                    ),
                                  );
                                },
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
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
