import 'package:freezed_annotation/freezed_annotation.dart';

enum ManaColor {
  @JsonValue("W")
  manaWhite,
  @JsonValue("U")
  manaBlue,
  @JsonValue("B")
  manaBlack,
  @JsonValue("R")
  manaRed,
  @JsonValue("G")
  manaGreen
}
