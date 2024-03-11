// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoriteCard _$FavoriteCardFromJson(Map<String, dynamic> json) {
  return _FavoriteCard.fromJson(json);
}

/// @nodoc
mixin _$FavoriteCard {
  String get uuid => throw _privateConstructorUsedError;
  Cards get card => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCardCopyWith<FavoriteCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCardCopyWith<$Res> {
  factory $FavoriteCardCopyWith(
          FavoriteCard value, $Res Function(FavoriteCard) then) =
      _$FavoriteCardCopyWithImpl<$Res, FavoriteCard>;
  @useResult
  $Res call({String uuid, Cards card});

  $CardsCopyWith<$Res> get card;
}

/// @nodoc
class _$FavoriteCardCopyWithImpl<$Res, $Val extends FavoriteCard>
    implements $FavoriteCardCopyWith<$Res> {
  _$FavoriteCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? card = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as Cards,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CardsCopyWith<$Res> get card {
    return $CardsCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavoriteCardImplCopyWith<$Res>
    implements $FavoriteCardCopyWith<$Res> {
  factory _$$FavoriteCardImplCopyWith(
          _$FavoriteCardImpl value, $Res Function(_$FavoriteCardImpl) then) =
      __$$FavoriteCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, Cards card});

  @override
  $CardsCopyWith<$Res> get card;
}

/// @nodoc
class __$$FavoriteCardImplCopyWithImpl<$Res>
    extends _$FavoriteCardCopyWithImpl<$Res, _$FavoriteCardImpl>
    implements _$$FavoriteCardImplCopyWith<$Res> {
  __$$FavoriteCardImplCopyWithImpl(
      _$FavoriteCardImpl _value, $Res Function(_$FavoriteCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? card = null,
  }) {
    return _then(_$FavoriteCardImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as Cards,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteCardImpl implements _FavoriteCard {
  const _$FavoriteCardImpl({required this.uuid, required this.card});

  factory _$FavoriteCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteCardImplFromJson(json);

  @override
  final String uuid;
  @override
  final Cards card;

  @override
  String toString() {
    return 'FavoriteCard(uuid: $uuid, card: $card)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteCardImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.card, card) || other.card == card));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, card);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteCardImplCopyWith<_$FavoriteCardImpl> get copyWith =>
      __$$FavoriteCardImplCopyWithImpl<_$FavoriteCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteCardImplToJson(
      this,
    );
  }
}

abstract class _FavoriteCard implements FavoriteCard {
  const factory _FavoriteCard(
      {required final String uuid,
      required final Cards card}) = _$FavoriteCardImpl;

  factory _FavoriteCard.fromJson(Map<String, dynamic> json) =
      _$FavoriteCardImpl.fromJson;

  @override
  String get uuid;
  @override
  Cards get card;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteCardImplCopyWith<_$FavoriteCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
