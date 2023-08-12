import 'dart:io';
import 'package:flutter/widgets.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String? path;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(path!),
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => errorBuilder(),
    );
  }

  // error-builder-image
  Widget errorBuilder() => Image.asset(
        'assets/images/logo_img.jpeg',
        width: width,
        height: height,
        fit: fit,
      );
}
