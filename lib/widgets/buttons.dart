import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../configs/config_colors.dart';
import '../configs/config_constants.dart';
import 'dividers.dart';

Widget btnOnboarding({required String title}) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        // gradient: LinearGradient(colors: <Color>[
        //   ConfigColor.primaryColor,
        //   ConfigColor.secondaryColor,
        // ]),
        color: ConfigColor.primaryColor,
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

Widget buttonSubmitDefault({
  required BuildContext context,
  IconData? iconData,
  required void Function() onPressed,
  required String text,
  bool isSubmitting = false,
  double scale = 1.0,
  EdgeInsets? padding,
  double? width,
  bool isOutline = false,
}) =>
    AnimatedContainer(
      width: isSubmitting ? 70.0 : width ?? MediaQuery.of(context).size.width,
      duration: ConfigConstant.animationDuration,
      curve: Curves.easeIn,
      child: Material(
        animationDuration: Duration(milliseconds: 100),
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            border: isOutline
                ? Border.all(
                    color:
                        isSubmitting ? Colors.grey : ConfigColor.primaryColor,
                    width: 2.0,
                  )
                : null,
            shape: isSubmitting ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isSubmitting ? null : BorderRadius.circular(24.0),
            gradient: LinearGradient(
                colors: isSubmitting
                    ? <Color>[
                        Colors.grey.shade700,
                        Colors.grey,
                      ]
                    : isOutline
                        ? <Color>[
                            Colors.white,
                            Colors.white,
                          ]
                        : <Color>[
                            ConfigColor.primaryColor,
                            ConfigColor.primaryColor,
                          ]),
          ),
          child: InkWell(
            splashColor: ConfigColor.primaryColor.withOpacity(0.4),
            onTap: isSubmitting ? null : onPressed,
            borderRadius: isSubmitting ? null : BorderRadius.circular(24.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: isSubmitting ? BoxShape.circle : BoxShape.rectangle,
              ),
              padding: padding ??
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: isSubmitting
                  ? SpinKitRing(
                      lineWidth: 2.0,
                      color: isOutline
                          ? ConfigColor.primaryColor
                          : ConfigColor.secondaryTextColor,
                      size: 20.0 * scale,
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (iconData != null) ...[
                          Icon(
                            iconData,
                            color: isOutline
                                ? ConfigColor.primaryColor
                                : ConfigColor.secondaryTextColor,
                            size: 20.0 * scale,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                        Flexible(
                          child: AutoSizeText(
                            text,
                            style: TextStyle(
                              color: isOutline
                                  ? ConfigColor.primaryColor
                                  : ConfigColor.secondaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                            minFontSize: 12.0,
                            maxFontSize: 20.0,
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );

Widget buttonCompact({
  IconData? iconData,
  required void Function()? onPressed,
  required String text,
  bool isSubmitting = false,
  Color? buttonColor,
  Color? textColor,
  double? elevation,
  double? size,
}) {
  if (iconData != null && !isSubmitting) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation ?? 0.0),
        backgroundColor:
            MaterialStateProperty.all(buttonColor ?? ConfigColor.primaryColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
      ),
      onPressed: isSubmitting ? null : onPressed,
      icon: Icon(
        iconData,
        size: size ?? 16.0,
        color: textColor ?? ConfigColor.secondaryTextColor,
      ),
      label: Text(
        text,
        style: TextStyle(
            color: textColor ?? ConfigColor.secondaryTextColor,
            fontSize: size ?? 16.0),
      ),
    );
  }

  return ElevatedButton(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(elevation ?? 0.0),
      backgroundColor:
          MaterialStateProperty.all(buttonColor ?? ConfigColor.primaryColor),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
    ),
    onPressed: isSubmitting ? null : onPressed,
    child: isSubmitting
        ? const FittedBox(
            fit: BoxFit.contain,
            child: SpinKitCircle(
              color: Colors.white,
              size: 16.0,
            ),
          )
        : Text(
            text,
            style: TextStyle(
                color: textColor ?? ConfigColor.secondaryTextColor,
                fontSize: size ?? 16.0),
          ),
  );
}

Widget buttonIcon({
  required IconData iconData,
  required void Function() onPressed,
  Color? color,
  double? size,
  String? tooltip,
}) =>
    IconButton(
      splashColor: Colors.grey.shade400,
      disabledColor: Colors.grey,
      icon: Icon(
        iconData,
        size: size,
      ),
      iconSize: size ?? 20.0,
      onPressed: onPressed,
      color: color ?? ConfigColor.primaryColor,
      tooltip: tooltip,
      padding: EdgeInsets.zero,
    );

Widget buttonFlatOK({required Function() onPressed}) => TextButton(
      child: Text('OK'),
      onPressed: onPressed,
    );

Widget buttonText({
  required String caption,
  required Function() onPressed,
  IconData? leadingIcon,
  Color? color,
  double? size,
}) =>
    Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onPressed,
        splashColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          margin: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingIcon != null) ...[
                Icon(
                  leadingIcon,
                  color: color ?? ConfigColor.primaryTextColor,
                  size: size != null ? size * 1.2 : size,
                ),
                dividerColTiny(),
              ],
              Text(
                caption,
                style: TextStyle(
                  fontSize: size,
                  color: color ?? ConfigColor.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
