import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/internal/hooks/effect_once_hook.dart';
import 'package:mtg_picker/ui/pages/card_details_page/card_details_page.dart';
import 'package:mtg_picker/ui/state_managment/card_controller/card_controller.dart';
import 'package:mtg_picker/ui/theme/theme.dart';
import 'package:mtg_picker/ui/widgets/app_bar/app_bar_search.dart';
import 'package:mtg_picker/ui/widgets/list_tile/list_tile_card/list_tile_%D1%81ard.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardPage extends HookWidget {
  const CardPage({super.key});

  static const double _navbarHeight = 72;

  @override
  Widget build(BuildContext context) {
    final cardController = useMemoized(
      () => CardController(
        GetIt.I<CardsRepository>(),
        GetIt.I<FavoriteCardRepository>(),
      ),
    );
    final mediaQueryData = MediaQuery.of(context);
    final viewInsets = mediaQueryData.viewInsets;

    useEffectOnce(() {
      cardController.loadCards();
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
                      isFavorite: cardController.isFiltered,
                      onFavoriteTapped: () {
                        cardController.toggleFavoritesFilter();
                      },
                      searchChanged: cardController.filterCardsByNameContains,
                      title: Text(
                        'Cards',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: themeData.textTheme.titleLarge,
                      ),
                    ),
                    Expanded(
                      child: Observer(
                        builder: (context) {
                          if (!cardController.isLoading) {
                            if (cardController.hasError) {
                              return Center(
                                child: Text(
                                  'Error loading cards',
                                  style: themeData.textTheme.titleMedium,
                                ),
                              );
                            }
                            if (cardController.cardsToShow == null ||
                                cardController.cardsToShow!.isEmpty) {
                              return Center(
                                child: Text('No cards available',
                                    style: themeData.textTheme.titleMedium),
                              );
                            }
                          }
                          return Skeletonizer(
                            enabled: cardController.isLoading,
                            ignoreContainers: true,
                            child: cardController.isLoading
                                ? ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    itemCount:
                                        cardController.mockedCards.length,
                                    itemBuilder: (context, index) {
                                      final card =
                                          cardController.mockedCards[index];
                                      return Column(
                                        children: [
                                          ListTileCard(
                                            card: card,
                                            onTap: () {},
                                            isFavorite: true,
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : ListView.separated(
                                    controller: cardController.scrollController,
                                    itemCount:
                                        cardController.cardsToShow!.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index <
                                          cardController.cardsToShow!.length) {
                                        final card =
                                            cardController.cardsToShow![index];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: ListTileCard(
                                            card: card,
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CardDetailsPage(
                                                          card: card),
                                                ),
                                              );
                                            },
                                            isFavorite:
                                                cardController.isFiltered,
                                          ),
                                        );
                                      } else if (cardController.isLoadingMore) {
                                        return const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        );
                                      }
                                      return null;
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        height: 2,
                                        color: Colors.brown,
                                      );
                                    },
                                  ),
                          );
                        },
                      ),
                    ),
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
