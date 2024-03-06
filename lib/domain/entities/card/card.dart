import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class Card with _$Card {
  const Card._();

  const factory Card({
    required String name,
    required String manaCost,
    required String type,
    required String rarity,
    required String imageUrl,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}
