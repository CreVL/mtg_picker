import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';

part 'favorite_card.freezed.dart';

part 'favorite_card.g.dart';

@freezed
class FavoriteCard with _$FavoriteCard {
  const factory FavoriteCard({
    required String uuid,
    required Cards card,
  }) = _FavoriteCard;

  factory FavoriteCard.fromJson(Map<String, dynamic> json) =>
      _$FavoriteCardFromJson(json);
}
