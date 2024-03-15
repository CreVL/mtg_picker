import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/ui/controllers/filter_bottom_sheet_controller/filter_bottom_sheet_controller.dart';
import 'package:mtg_picker/ui/providers/provider.dart';
import 'package:mtg_picker/ui/state_management/card_controller/card_controller.dart';

import '../../internal/hooks/effect_once_hook.dart';
import 'multi_provider.dart';

class RootProviders extends HookWidget {
  final Widget child;

  const RootProviders({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardController = useMemoized(
      () => CardController(
        GetIt.I<CardsRepository>(),
        GetIt.I<FavoriteCardRepository>(),
      ),
    );
    final filterBottomSheetController = useMemoized(
      () => FilterBottomSheetController(filterChanged: (_) {}),
    );

    useEffectOnce(() {
      cardController.loadCards();
    });

    useEffectOnce(() {
      filterBottomSheetController.updateFilters();
    });

    return Observer(builder: (context) {
      return MultiProvider(
        providersBuilders: [
          (child) => Provider<CardController>(
                data: cardController,
                child: child,
              ),
          (child) => Provider<FilterBottomSheetController>(
                data: filterBottomSheetController,
                child: child,
              ),
        ],
        child: child,
      );
    });
  }
}
