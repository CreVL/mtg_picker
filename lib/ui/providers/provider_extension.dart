import 'package:flutter/widgets.dart';
import 'package:mtg_picker/ui/providers/provider.dart';

extension ProviderExtension on BuildContext {
  T watch<T>() {
    final provider = dependOnInheritedWidgetOfExactType<Provider<T>>();
    assert(
      provider != null,
      'No Provider found for type "${T.toString()}" in context',
    );
    return provider!.data;
  }
}
