import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<Callable>(),
])
abstract class Callable<T> {
  void call([T? arg]) {}
}
