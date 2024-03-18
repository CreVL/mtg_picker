import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mtg_picker/ui/pages/card_details_page/card_details_page.dart';
import 'package:mtg_picker/ui/providers/provider_extension.dart';
import 'package:mtg_picker/ui/state_management/card_controller/card_controller.dart';
import 'package:mtg_picker/ui/theme/theme.dart';
import 'package:mtg_picker/ui/widgets/app_bar/app_bar_search.dart';
import 'package:mtg_picker/ui/widgets/bottom_sheet/filter_bottom_sheet/filter_bottom_sheet.dart';
import 'package:mtg_picker/ui/widgets/list_tile/list_tile_card/list_tile_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../resources/app_colors.dart';

class CardPage extends HookWidget {
  const CardPage({super.key});

  static const double _navbarHeight = 72;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final viewInsets = mediaQueryData.viewInsets;
    final cardController = context.watch<CardController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Builder(
          builder: (context) {
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
                        isFavorite: cardController.isFavoriteFilter,
                        onFavoriteTapped: () {
                          cardController.toggleFavorites();
                        },
                        searchChanged: cardController.toggleSearch,
                        title: Text(
                          'Cards',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: themeData.textTheme.titleLarge,
                        ),
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.brown,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return FilterBottomSheet(
                                filterChanged: (selectedColors) {
                                  cardController
                                      .toggleManaCostFilter(selectedColors);
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              cardController.isManaCostFilter
                                  ? const Icon(
                                      Icons.filter_alt_outlined,
                                      color: AppColors.orange,
                                      size: 24,
                                    )
                                  : const Icon(
                                      Icons.filter_alt_off_outlined,
                                      color: AppColors.orange,
                                      size: 24,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.brown,
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
                                  child: Text(
                                    'No cards available',
                                    style: themeData.textTheme.titleMedium,
                                  ),
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
                                      controller:
                                          cardController.scrollController,
                                      itemCount:
                                          cardController.cardsToShow!.length +
                                              1,
                                      itemBuilder: (context, index) {
                                        if (index <
                                            cardController
                                                .cardsToShow!.length) {
                                          final card = cardController
                                              .cardsToShow![index];
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
                                                      card: card,
                                                    ),
                                                  ),
                                                );
                                              },
                                              isFavorite: cardController
                                                  .isFavoriteFilter,
                                            ),
                                          );
                                        } else if (cardController
                                                .isPagination &&
                                            !cardController.isFavoriteFilter &&
                                            !cardController.isSearch &&
                                            !cardController.isManaCostFilter) {
                                          return const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
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
          },
        ),
      ),
    );
  }
}
