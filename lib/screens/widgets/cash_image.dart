import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CashImageW extends StatelessWidget {
  const CashImageW(
      {Key? key, required this.imageUrl, this.boxFit = BoxFit.contain})
      : super(key: key);
  final String imageUrl;
  final BoxFit boxFit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: boxFit,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator(color: kPrimColor)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
