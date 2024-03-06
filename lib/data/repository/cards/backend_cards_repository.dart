import 'package:mtg_picker/application/repository/cards/cards_repository.dart';
import 'package:mtg_picker/application/repository/repository_error.dart';
import 'package:mtg_picker/data/values/url_address.dart';
import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:dio/dio.dart';
import 'package:mtg_picker/internal/entities/either.dart';

class BackendCardsRepository implements CardsRepository {
  final Dio _dio;

  BackendCardsRepository({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<Either<RepositoryError, List<Cards>>> getCards({int page = 1}) async {
    try {
      final response = await _dio.get(
        UrlAddress.cards,
        queryParameters: {
          'page': page,
          'contains': 'imageUrl',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['cards'];

        final List<Cards> cards = responseData.map((data) {
          return Cards.fromJson(data);
        }).toList();
        return Either.right(cards);
      } else {
        return Either.left(BadHttpResponseRepositoryError());
      }
    } catch (e) {
      return Either.left(UnknownRepositoryError());
    }
  }
}
