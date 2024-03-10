import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
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
    final controller = useMemoized(
      () => CardController(GetIt.I<CardsRepository>()),
    );
    final mediaQueryData = MediaQuery.of(context);
    final viewInsets = mediaQueryData.viewInsets;
    useEffect(() {
      controller.loadCards();
    }, []);

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
                      child: Observer(
                        builder: (context) {
                          if (!controller.isLoading) {
                            if (controller.hasError) {
                              return Center(
                                child: Text('Error loading cards',
                                    style: themeData.textTheme.titleSmall),
                              );
                            }
                            if (controller.cardsToShow == null ||
                                controller.cardsToShow!.isEmpty) {
                              return Center(
                                child: Text('No cards available',
                                    style: themeData.textTheme.titleSmall),
                              );
                            }
                          }
                          return Skeletonizer(
                            enabled: controller.isLoading,
                            ignoreContainers: true,
                            child: controller.isLoading
                                ? ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    itemCount: controller.mockedCards.length,
                                    itemBuilder: (context, index) {
                                      final card =
                                          controller.mockedCards[index];
                                      return Column(
                                        children: [
                                          ListTileCard(
                                            card: card,
                                            onTap: () {},
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : ListView.separated(
                                    controller: controller.scrollController,
                                    itemCount:
                                        controller.cardsToShow!.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index <
                                          controller.cardsToShow!.length) {
                                        final card =
                                            controller.cardsToShow![index];
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
                                          ),
                                        );
                                      } else {
                                        return const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        );
                                      }
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
