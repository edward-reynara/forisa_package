import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../configs/config_colors.dart';
import 'buttons.dart';

class UploadImageWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData iconData;
  final Color buttonColor;
  final String filePath;
  final controllerGallery;
  final controllerCamera;
  final controller;

  const UploadImageWidget({super.key,
    required this.onPressed,
    required this.text,
    required this.iconData,
    required this.buttonColor,
    required this.filePath,
    required this.controllerGallery,
    required this.controllerCamera,
    required this.controller,
  });

  // final _controller = Get.put(AuthController(AuthTag.register),
  //     tag: FormatUtil.getRandomString(type: RandomType.classId));

  @override
  Widget build(BuildContext context) {
    if (filePath.isEmpty) {
      return buttonCompact(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return SimpleDialog(
                title: const Text("Camera/Gallery"),
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      controllerGallery(ImageSource.gallery);
                    },
                    child: const Text('Pilih dari Galeri'),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      controllerCamera(ImageSource.camera);
                    },
                    child: const Text('Ambil dari Kamera'),
                  ),
                ],
              );
            },
          );
        },
        text: text,
        iconData: iconData,
        buttonColor: buttonColor,
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            color: ConfigColor.primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.file(
                File(filePath),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: buttonCompact(
                onPressed: () => controller.iDNoFilePath.value = '',
                text: 'Hapus',
                iconData: FontAwesomeIcons.trash,
              ),
            ),
          ],
        ),
      );
    }
  }
}