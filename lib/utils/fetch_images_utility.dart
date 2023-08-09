import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaUtility {
  MediaUtility._();
  static final MediaUtility instance = MediaUtility._();

  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>> pickMultiImage({BuildContext? context}) async {
    List<XFile> images = [];
    await _picker.pickMultiImage(imageQuality: 50).then((imgs) {
      images = imgs;
    }, onError: (e) {
      log(e.message.toString());
    });
    return images;
  }
}
