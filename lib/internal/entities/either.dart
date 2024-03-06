abstract class Either<L, R> {
  B resolve<B>(B Function(L l) ifLeft, B Function(R r) ifRight);

  bool get isLeft => resolve((l) => true, (r) => false);
  bool get isRight => resolve((l) => false, (r) => true);

  L? get left => resolve((l) => l, (r) => null);
  R? get right => resolve((l) => null, (r) => r);

  const Either();

  factory Either.left(L value) => _Left(value);
  factory Either.right(R value) => _Right(value);

  @override
  String toString() => resolve((l) => 'Left($l)', (r) => 'Right($r)');
}

class _Left<L, R> extends Either<L, R> {
  final L value;

  _Left(this.value);

  @override
  B resolve<B>(B Function(L l) ifLeft, B Function(R r) ifRight) {
    return ifLeft(value);
  }
}

class _Right<L, R> extends Either<L, R> {
  final R value;

  _Right(this.value);

  @override
  B resolve<B>(B Function(L l) ifLeft, B Function(R r) ifRight) {
    return ifRight(value);
  }
}
