import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../configs/config_colors.dart';

PreferredSizeWidget cleanAppBar({
  required String title,
  List<Widget> actions = const [],
  PreferredSizeWidget? bottom,
}) =>
    AppBar(
      title: Text(
        title,
        style: TextStyle(color: ConfigColor.primaryTextColor),
      ),
      backgroundColor: ConfigColor.backgroundColor,
      actions: actions,
      bottom: bottom,
      elevation: 0.0,
      iconTheme: IconThemeData(color: ConfigColor.primaryTextColor),
    );

PreferredSizeWidget transparentAppBar({
  required String title,
  List<Widget> actions = const [],
  PreferredSizeWidget? bottom,
}) =>
    AppBar(
      title: Text(
        title,
        style: TextStyle(color: ConfigColor.primaryTextColor),
      ),
      backgroundColor: Colors.transparent,
      actions: actions,
      bottom: bottom,
      elevation: 0.0,
      iconTheme: IconThemeData(color: ConfigColor.primaryTextColor),
    );

PreferredSizeWidget searchAppBar(
    {required String title,
    required TextEditingController controller,
    required Function onSubmit}) {
  return AppBar(
    iconTheme: IconThemeData(color: ConfigColor.primaryTextColor),
    backgroundColor: ConfigColor.backgroundColor,
    title: Container(
      margin: EdgeInsets.zero,
      height: kToolbarHeight / 1.5,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade400.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Align(
        alignment: Alignment.center,
              child: TextField(
          controller: controller,
          decoration: InputDecoration(
            isCollapsed: true,
            hintText: title,
            border: InputBorder.none,
          ),
          style: TextStyle(color: ConfigColor.primaryTextColor),
          cursorColor: ConfigColor.primaryColor,
          // autofocus: true,
          textInputAction: TextInputAction.search,
          minLines: 1,
          maxLines: 1,
          textAlign: TextAlign.start,
          onEditingComplete: () {
            onSubmit();
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    ),
    actions: [
      IconButton(
          icon: const Icon(FontAwesomeIcons.search),
          onPressed: () {
            onSubmit();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          splashColor: Colors.grey[400])
    ],
  );
}

PreferredSizeWidget mapSearchBar({
  required Widget child,
  List<Widget>? actions,
}) {
  return AppBar(
    iconTheme: IconThemeData(color: ConfigColor.primaryTextColor),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Container(
      margin: const EdgeInsets.only(right: 10.0),
      height: kToolbarHeight / 1.5,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    ),
    titleSpacing: 0.0,
    actions: actions,
  );
}
