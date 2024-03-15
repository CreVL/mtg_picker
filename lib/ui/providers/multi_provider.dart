import 'package:flutter/material.dart';

class MultiProvider extends StatelessWidget {
  final List<Widget Function(Widget child)> providersBuilders;
  final Widget child;

  const MultiProvider({
    super.key,
    required this.providersBuilders,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var lastWidget = providersBuilders.last(child);
    for (int i = providersBuilders.length - 2; i >= 0; i--) {
      lastWidget = providersBuilders[i](lastWidget);
    }
    return lastWidget;
  }
}
