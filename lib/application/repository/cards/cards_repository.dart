import 'package:mtg_picker/domain/entities/card/card.dart';
import 'package:mtg_picker/internal/entities/either.dart';

import '../repository_error.dart';

abstract class CardsRepository {
  Future<Either<RepositoryError, List<Cards>>> getCards({int page});
}
