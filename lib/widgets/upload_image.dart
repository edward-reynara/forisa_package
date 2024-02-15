import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../configs/config_colors.dart';
import 'buttons.dart';

class UploadImageWidget extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Color buttonColor;
  final controllerGallery;
  final controllerCamera;
  final controller;

  const UploadImageWidget({super.key,
    required this.text,
    required this.iconData,
    required this.buttonColor,
    required this.controllerGallery,
    required this.controllerCamera,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.iDNoFilePath.value.isEmpty) {
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
                  File(controller.iDNoFilePath.value),
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
    });
  }
}
