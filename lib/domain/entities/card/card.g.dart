// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardImpl _$$CardImplFromJson(Map<String, dynamic> json) => _$CardImpl(
      name: json['name'] as String,
      manaCost: json['manaCost'] as String,
      type: json['type'] as String,
      rarity: json['rarity'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$CardImplToJson(_$CardImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'manaCost': instance.manaCost,
      'type': instance.type,
      'rarity': instance.rarity,
      'imageUrl': instance.imageUrl,
    };
