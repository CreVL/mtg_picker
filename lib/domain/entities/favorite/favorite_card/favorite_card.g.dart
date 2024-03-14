// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteCardImpl _$$FavoriteCardImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteCardImpl(
      uuid: json['uuid'] as String,
      card: Cards.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FavoriteCardImplToJson(_$FavoriteCardImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'card': instance.card,
    };
