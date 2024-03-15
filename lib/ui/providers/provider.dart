import 'package:flutter/material.dart';

class Provider<T> extends InheritedWidget {
  final T data;
  late final bool Function(Provider<T> oldWidget) _updateShouldNotify;

  Provider({
    Key? key,
    required Widget child,
    required this.data,
    bool Function(Provider<T> oldWidget)? updateShouldNotify,
  }) : super(
          key: key,
          child: child,
        ) {
    if (updateShouldNotify == null) {
      _updateShouldNotify = (oldWidget) => data != oldWidget.data;
    } else {
      _updateShouldNotify = updateShouldNotify;
    }
  }

  @override
  bool updateShouldNotify(covariant Provider<T> oldWidget) =>
      _updateShouldNotify(oldWidget);
}
