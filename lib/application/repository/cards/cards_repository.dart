import 'package:mtg_picker/domain/entities/card/card.dart';

abstract class CardsRepository {
  Future<List<Card>> getCards({int page});
}
