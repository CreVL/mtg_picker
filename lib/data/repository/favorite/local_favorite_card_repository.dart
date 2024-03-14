import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:mtg_picker/application/repository/favorite/favorite_card_repository.dart';
import 'package:mtg_picker/application/repository/repository_error.dart';
import 'package:mtg_picker/data/extentions/hive_box_uuid_extension.dart';
import 'package:mtg_picker/data/hive_boxes/hive_boxes.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/domain/entities/favorite/favorite_card/favorite_card.dart';
import 'package:mtg_picker/internal/entities/either.dart';

class LocalFavoriteCardRepository implements FavoriteCardRepository {
  final box = Hive.box<String>(HiveBoxes.favoriteCards);

  @override
  Future<Either<RepositoryError, List<FavoriteCard>>> getFavoriteCards() async {
    try {
      final favoriteCards = <FavoriteCard>[];
      final map = box.toMap();
      for (final entry in map.entries) {
        final uuid = entry.key;
        final map = jsonDecode(entry.value);
        map["uuid"] = uuid;
        final favoriteCard = FavoriteCard.fromJson(map);
        favoriteCards.add(favoriteCard);
      }
      return Either.right(favoriteCards);
    } catch (e) {
      return Either.left(UnknownRepositoryError());
    }
  }

  @override
  Future<Either<RepositoryError, FavoriteCard>> createFavoriteCard(
    Cards card,
  ) async {
    try {
      final cards = {
        "card": card.toJson(),
      };
      final uuid = await box.addWithUuidV4(jsonEncode(cards));
      final favoriteCard = FavoriteCard(
        uuid: uuid,
        card: card,
      );
      return Either.right(favoriteCard);
    } catch (e) {
      return Either.left(UnknownRepositoryError());
    }
  }

  @override
  Future<Either<RepositoryError, bool>> deleteFavoriteCard(
    String uuid,
  ) async {
    try {
      await box.delete(uuid);
      return Either.right(true);
    } catch (e) {
      return Either.left(UnknownRepositoryError());
    }
  }
}
