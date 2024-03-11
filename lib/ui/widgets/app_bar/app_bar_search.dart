import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mtg_picker/ui/controllers/app_bar_search_controller/app_bar_search_controller.dart';
import 'package:mtg_picker/ui/resurces/app_colors.dart';
import 'package:mtg_picker/ui/widgets/panels/search_field_panel.dart';

class AppBarSearch extends HookWidget {
  final Widget title;
  final bool canSearch;
  final Function(String text)? searchChanged;
  final Function()? onBackTapped;
  final Function()? onFavoriteTapped;
  final bool isFavorite;

  const AppBarSearch({
    super.key,
    required this.title,
    this.onBackTapped,
    required this.searchChanged,
    this.canSearch = true,
    this.onFavoriteTapped,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final appBarSearchController = useMemoized(
      () => AppBarSearchController(
        searchChanged: searchChanged,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 4,
      ),
      child: Observer(
        builder: (context) {
          return appBarSearchController.isSearchActivated
              ? Row(
                  children: [
                    Expanded(
                      child: SearchFieldPanel(
                        textEditingController:
                            appBarSearchController.textEditingController,
                        onChanged: appBarSearchController.textChanged,
                        onClear: appBarSearchController.cleanSearchField,
                        onCancel: appBarSearchController.toggleSearchActivated,
                        canClear: appBarSearchController.canCleanSearch,
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    if (onFavoriteTapped != null) ...[
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: onFavoriteTapped,
                        child: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: AppColors.orange,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                    Expanded(
                      child: title,
                    ),
                    if (canSearch) ...[
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: appBarSearchController.toggleSearchActivated,
                        child: const Icon(
                          Icons.search,
                          color: AppColors.orange,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ] else ...[
                      const SizedBox(
                        width: 56,
                      ),
                    ],
                  ],
                );
        },
      ),
    );
  }
}
