// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cards _$CardsFromJson(Map<String, dynamic> json) {
  return _Cards.fromJson(json);
}

/// @nodoc
mixin _$Cards {
  String get name => throw _privateConstructorUsedError;
  String get manaCost => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get rarity => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardsCopyWith<Cards> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsCopyWith<$Res> {
  factory $CardsCopyWith(Cards value, $Res Function(Cards) then) =
      _$CardsCopyWithImpl<$Res, Cards>;
  @useResult
  $Res call(
      {String name,
      String manaCost,
      String type,
      String rarity,
      String imageUrl});
}

/// @nodoc
class _$CardsCopyWithImpl<$Res, $Val extends Cards>
    implements $CardsCopyWith<$Res> {
  _$CardsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? manaCost = null,
    Object? type = null,
    Object? rarity = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      manaCost: null == manaCost
          ? _value.manaCost
          : manaCost // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardsImplCopyWith<$Res> implements $CardsCopyWith<$Res> {
  factory _$$CardsImplCopyWith(
          _$CardsImpl value, $Res Function(_$CardsImpl) then) =
      __$$CardsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String manaCost,
      String type,
      String rarity,
      String imageUrl});
}

/// @nodoc
class __$$CardsImplCopyWithImpl<$Res>
    extends _$CardsCopyWithImpl<$Res, _$CardsImpl>
    implements _$$CardsImplCopyWith<$Res> {
  __$$CardsImplCopyWithImpl(
      _$CardsImpl _value, $Res Function(_$CardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? manaCost = null,
    Object? type = null,
    Object? rarity = null,
    Object? imageUrl = null,
  }) {
    return _then(_$CardsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      manaCost: null == manaCost
          ? _value.manaCost
          : manaCost // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardsImpl extends _Cards {
  const _$CardsImpl(
      {required this.name,
      required this.manaCost,
      required this.type,
      required this.rarity,
      required this.imageUrl})
      : super._();

  factory _$CardsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardsImplFromJson(json);

  @override
  final String name;
  @override
  final String manaCost;
  @override
  final String type;
  @override
  final String rarity;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Cards(name: $name, manaCost: $manaCost, type: $type, rarity: $rarity, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.manaCost, manaCost) ||
                other.manaCost == manaCost) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, manaCost, type, rarity, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardsImplCopyWith<_$CardsImpl> get copyWith =>
      __$$CardsImplCopyWithImpl<_$CardsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardsImplToJson(
      this,
    );
  }
}

abstract class _Cards extends Cards {
  const factory _Cards(
      {required final String name,
      required final String manaCost,
      required final String type,
      required final String rarity,
      required final String imageUrl}) = _$CardsImpl;
  const _Cards._() : super._();

  factory _Cards.fromJson(Map<String, dynamic> json) = _$CardsImpl.fromJson;

  @override
  String get name;
  @override
  String get manaCost;
  @override
  String get type;
  @override
  String get rarity;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$CardsImplCopyWith<_$CardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
