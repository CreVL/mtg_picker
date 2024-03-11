import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/data/repository/cards/backend_cards_repository.dart';
import 'package:mtg_picker/data/repository/favorite/local_favorite_card_repository.dart';

class GetItInitializer {
  static final _getIt = GetIt.instance;

  static void setupAll() {
    _setupRepositories();
  }

  static void _setupRepositories() {
    _getIt.registerLazySingleton<Dio>(
      () => Dio(),
    );

    _getIt.registerLazySingleton<CardsRepository>(
      () => BackendCardsRepository(
        dio: _getIt<Dio>(),
      ),
    );

    _getIt.registerLazySingleton<FavoriteCardRepository>(
      () => LocalFavoriteCardRepository(),
    );
  }
}
