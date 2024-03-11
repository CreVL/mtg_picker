import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBoxes {
  static const String favoriteCards = "favorite_cards";

  static Future<void> initialize() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    await _prepareAllBoxes();
  }

  static Future<void> _prepareAllBoxes() {
    final futures = <Future>[];
    futures.add(_prepareBox(favoriteCards));
    return Future.wait(futures);
  }

  static Future _prepareBox(String name) async {
    await Hive.openBox<String>(name);
  }
}
