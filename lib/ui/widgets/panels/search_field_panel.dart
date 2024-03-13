import 'package:flutter/material.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';
import 'package:mtg_picker/ui/widgets/text_fields/text_fields.dart';

class SearchFieldPanel extends StatelessWidget {
  final Function(String text)? onSubmitted;
  final Function(String text)? onChanged;
  final Function()? onClear;
  final Function()? onCancel;
  final TextEditingController textEditingController;
  final bool canClear;

  const SearchFieldPanel({
    super.key,
    required this.textEditingController,
    this.onSubmitted,
    this.onCancel,
    this.onClear,
    this.onChanged,
    this.canClear = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFields.search(
              textEditingController: textEditingController,
              context: context,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              trailing: canClear
                  ? GestureDetector(
                      onTap: onClear,
                      child: const Icon(
                        Icons.clear,
                        color: AppColors.orange,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: onCancel,
            behavior: HitTestBehavior.translucent,
            child: Text(
              "Cancel",
              style: themeData.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
