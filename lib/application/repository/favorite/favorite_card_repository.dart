import 'package:mtg_picker/application/repository/repository_error.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/domain/entities/favorite/favorite_card/favorite_card.dart';
import 'package:mtg_picker/internal/entities/either.dart';

abstract class FavoriteCardRepository {
  Future<Either<RepositoryError, List<FavoriteCard>>> getFavoriteCards();

  Future<Either<RepositoryError, FavoriteCard>> createFavoriteCard(Cards cards);

  Future<Either<RepositoryError, bool>> deleteFavoriteCard(String uuid);
}
