import 'package:flutter/material.dart';
import 'package:mtg_picker/ui/resources/app_colors.dart';
import 'package:mtg_picker/ui/theme/theme.dart';
import 'package:photo_view/photo_view.dart';

class CardImageViewPage extends StatelessWidget {
  final String cardImageUrl;

  const CardImageViewPage({super.key, required this.cardImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preview card',
          style: themeData.textTheme.titleLarge,
        ),
      ),
      body: PhotoView(
        imageProvider: NetworkImage(cardImageUrl),
        backgroundDecoration: const BoxDecoration(
          color: AppColors.brown_1,
        ),
        initialScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
