import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/utils.dart';
import 'package:image_picker/image_picker.dart';

class PickerUtil {
  static Future<DateTime?> pickDate({
    required BuildContext context,
    DateTime? currentTime,
  }) async {
    DateTime now = DateTime.now();

    return await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900),
      maxTime: DateTime(now.year + 1),
      currentTime: currentTime ?? now,
      locale: Get.locale?.languageCode == 'id' ? LocaleType.id : LocaleType.en,
    );
  }

  static Future<void> removeFile(String path) async {
    if (await File(path).exists()) {
      await File(path).delete();
    }
  }

  static Future<bool> checkFile(String path) async {
    return await File(path).exists();
  }

  static Future<String> pickImage(ImageSource source) async {
    var img = await ImagePicker().pickImage(
      source: source,
      imageQuality: 100,
      maxWidth: 500.0,
      maxHeight: 1000.0,
    );

    if (img != null) {
      return img.path;
    }

    return '';
  }
}
