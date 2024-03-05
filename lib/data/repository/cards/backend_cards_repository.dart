import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/data/values/url_address.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:dio/dio.dart';

class BackendCardsRepository implements CardsRepository {
  final Dio _dio;

  BackendCardsRepository({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<List<Card>> getCards({int page = 1}) async {
    final response = await _dio.get(
      UrlAddress.cards,
      queryParameters: {'page': page},
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data['cards'];

      final List<Card> cards = responseData.map((data) {
        return Card.fromJson(data);
      }).toList();
      return cards;

    } else {
      throw Exception('Failed to load cards: ${response.statusCode}');
    }
  }
}
