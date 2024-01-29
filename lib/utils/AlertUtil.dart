import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forisa_package/widgets/buttons.dart';
import 'package:forisa_package/widgets/dividers.dart';
import 'package:get/get.dart';

import '../configs/config_colors.dart';
import '../configs/config_constants.dart';

enum DialogStatus { success, error, info }
enum AlertStatus { success, error, info }

class AlertUtil {
  final BuildContext context;

  AlertUtil(this.context);

  Future<void> showResponseDialog({
    String? title,
    String? content,
    required DialogStatus status,
    void Function(BuildContext context)? onOk,
    bool barrierDismissable = true,
    bool canPop = true,
  }) async {
    String icon;
    String statusText;
    Color color;
    switch (status) {
      case DialogStatus.success:
        icon = 'success';
        statusText = 'Berhasil';
        color = ConfigColor.successColor;
        break;
      case DialogStatus.error:
        icon = 'error';
        statusText = 'Gagal';
        color = ConfigColor.errorColor;
        break;
      default:
        icon = 'info';
        statusText = 'Info';
        color = ConfigColor.infoColor;
    }
    await showDialog(
        barrierDismissible: barrierDismissable,
        context: context,
        builder: (dialogContext) => WillPopScope(
              onWillPop: () async => canPop,
              child: Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            ColorFiltered(
                              colorFilter:
                                  ColorFilter.mode(color, BlendMode.srcATop),
                              child: Image.asset(
                                'assets/images/$icon.png',
                                width: 100,
                                height: 100.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              title ?? statusText,
                              style: TextStyle(
                                color: ConfigColor.primaryTextColor,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              content ?? '',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            buttonCompact(
                              onPressed: () {
                                if (onOk != null) {
                                  onOk(dialogContext);
                                } else {
                                  Navigator.of(dialogContext).pop();
                                }
                              },
                              text: 'OK',
                              buttonColor: color,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Future<bool> showConfirmDialog(
      {String? title,
      String? msg,
      String? okText,
      String? cancelText,
      bool replacePrimary = false,
      Color? color
      }) async {
    final btnColor = color;
    return await showDialog<bool?>(
            context: context,
            barrierDismissible: true,
            builder: (dialogContext) {
              return AlertDialog(
                title: Text(title ?? ConfigConstant.TR_CONFIRM_TITLE.tr),
                content: Text(msg ?? ConfigConstant.TR_CONFIRM_MSG.tr),
                actions: <Widget>[
                  buttonCompact(
                    buttonColor: replacePrimary ? null : Colors.transparent,
                    textColor: replacePrimary
                        ? null
                        : ConfigColor.primaryTextColor.withOpacity(0.7),
                    text: cancelText ?? ConfigConstant.TR_NO.tr,
                    onPressed: () {
                      Navigator.pop(dialogContext, false);
                    },
                  ),
                  buttonCompact(
                    buttonColor: !replacePrimary ? btnColor : Colors.transparent,
                    textColor: !replacePrimary
                        ? null
                        : ConfigColor.primaryTextColor.withOpacity(0.7),
                    text: okText ?? ConfigConstant.TR_YES.tr,
                    onPressed: () {
                      Navigator.pop(dialogContext, true);
                    },
                  ),
                ],
              );
            }) ??
        false;
  }

  Future<bool> showConfirmCheckboxDialog({
    String? title,
    String? msg,
    String? msgDetail,
    String? okText,
    String? cancelText,
    bool replacePrimary = false,
    Color? color
  }) async {
    bool isCheckboxChecked = false;
    final btnColor = color;
    return await showDialog<bool?>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(title ?? ConfigConstant.TR_CONFIRM_TITLE.tr),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(msg ?? ConfigConstant.TR_CONFIRM_MSG.tr),
                    const SizedBox(height: 8),
                    Text(msgDetail ?? ConfigConstant.TR_CONFIRM_MSG_DETAIL.tr,
                      style: const TextStyle(
                        fontSize: 12.0,
                      )),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: isCheckboxChecked,
                          onChanged: (value) {
                            setState(() {
                              isCheckboxChecked = value ?? false;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text('I agree to the terms and conditions'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                buttonCompact(
                  buttonColor:
                  replacePrimary ? null : Colors.transparent,
                  textColor: replacePrimary
                      ? null
                      : ConfigColor.primaryTextColor.withOpacity(0.7),
                  text: cancelText ?? ConfigConstant.TR_NO.tr,
                  onPressed: () {
                    Navigator.pop(dialogContext, false);
                  },
                ),
                buttonCompact(
                  buttonColor: isCheckboxChecked
                      ? (!replacePrimary ? btnColor : Colors.transparent)
                      : Colors.grey,
                  textColor: !replacePrimary
                      ? null
                      : ConfigColor.primaryTextColor.withOpacity(0.7),
                  text: okText ?? ConfigConstant.TR_YES.tr,
                  onPressed: isCheckboxChecked
                      ? () {
                    Navigator.pop(dialogContext, true);
                  }
                      : null,
                ),
              ],
            );
          },
        );
      },
    ) ??
        false;
  }

  void showSnackbar(
      String title,
      String msg,
      AlertStatus status,
      {Function()? buttonPressed,
        String? buttonText,
        bool persistent = false
      }) {
    Get.snackbar(
      title,
      msg,
      icon: const Icon(
        FontAwesomeIcons.bell,
        size: 20.0,
        color: Colors.white,
      ),
      shouldIconPulse: false,
      backgroundColor: status == AlertStatus.error
          ? Colors.red
          : status == AlertStatus.info
              ? Colors.blue
              : Colors.green,
      colorText: ConfigColor.secondaryTextColor,
      barBlur: 8.0,
      borderRadius: 14.0,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      dismissDirection: DismissDirection.horizontal,
      animationDuration: const Duration(milliseconds: 300),
      duration: Duration(seconds: persistent ? 30 : 3),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      mainButton: buttonPressed != null
          ? TextButton(
              onPressed: buttonPressed,
              child: Text(buttonText ?? '-',
                  style: TextStyle(
                    color: ConfigColor.secondaryTextColor,
                  )))
          : null,
    );
  }

  static void showProgressDialog({
    required BuildContext context,
    String? text,
    Color? color,
    bool dismissable = false,
  }) async {
    await showDialog(
        context: context,
        builder: (dialogContext) => WillPopScope(
            child: Dialog(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              child: Align(
                alignment: FractionalOffset.center,
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FittedBox(
                      alignment: FractionalOffset.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: SpinKitDualRing(
                              size: 18.0,
                              lineWidth: 2.0,
                              color: color ?? ConfigColor.primaryColor,
                            ),
                          ),
                          dividerForm(),
                          const Text('Memuat...',
                              style: TextStyle(
                                  fontSize: 8.0, fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            onWillPop: () async => dismissable),
        barrierDismissible: false);
  }
}
