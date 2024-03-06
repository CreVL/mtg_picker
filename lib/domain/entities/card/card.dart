import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class Cards with _$Cards {
  const Cards._();

  const factory Cards({
    required String name,
    required String manaCost,
    required String type,
    required String rarity,
    required String imageUrl,
  }) = _Cards;

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);
}
