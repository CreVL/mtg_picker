import '../domain/enums/mana_color.dart';

String getStringMana(ManaColor color) {
  return manaColors[color] ?? "";
}

final Map<ManaColor, String> manaColors = {
  ManaColor.manaWhite: 'W',
  ManaColor.manaBlue: 'U',
  ManaColor.manaBlack: 'B',
  ManaColor.manaRed: 'R',
  ManaColor.manaGreen: 'G',
  ManaColor.manaTransparent: 'X',
};

int getIntManaCount(String manaCost) {
  return RegExp(r'\d+')
      .allMatches(manaCost)
      .map((match) => int.parse(match.group(0)!))
      .fold(0, (prev, element) => prev + element);
}
