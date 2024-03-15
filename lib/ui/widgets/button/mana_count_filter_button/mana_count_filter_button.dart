import 'package:flutter/material.dart';

class ManaCountFilterButton extends StatelessWidget {
  final bool isCountDown;
  final VoidCallback onTap;

  const ManaCountFilterButton({
    super.key,
    required this.isCountDown,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isCountDown
            ? Icons.arrow_drop_up_rounded
            : Icons.arrow_drop_down_rounded,
        size: 24,
        color: Colors.grey,
      ),
    );
  }
}
