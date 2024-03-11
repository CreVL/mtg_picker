import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

extension HiveBoxUUIDExtension<T> on BoxBase<T> {
  static const _uuid = Uuid();

  Future<String> addWithUuidV4(T item) async {
    final generatedUuid = _uuid.v4();
    await put(generatedUuid, item);
    return generatedUuid;
  }
}
