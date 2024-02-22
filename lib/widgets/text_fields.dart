import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../configs/config_colors.dart';

typedef FutureOr<Iterable<T>> SuggestionsCallback<T>(String pattern);
typedef Widget ItemBuilder<T>(BuildContext context, T itemData);
typedef void SuggestionSelectionCallback<T>(T suggestion);
typedef Widget ErrorBuilder(BuildContext context, Object? error);

InputDecoration defaultInputDecor() => InputDecoration(
      filled: true,
      fillColor: Colors.white70,
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide:
            BorderSide(width: 1.5, color: Colors.black38.withOpacity(0.3)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide:
            BorderSide(width: 1.5, color: Colors.black38.withOpacity(0.3)),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(width: 1.5, color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide(width: 2.5, color: ConfigColor.primaryColor),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide(width: 2.5, color: Colors.red),
      ),
    );

TextField defaultTxtField({
  required TextEditingController controller,
  String? hint,
  String? label,
  String? errorText,
  bool isDisable = false,
  bool isSecret = false,
  bool isCollapsed = false,
  int? minLines,
  int? maxlines,
  void Function(String)? onChanged,
  Widget? suffixIcon,
  List<TextInputFormatter> inputFormats = const [],
  TextInputType inputType = TextInputType.text,
  TextInputAction? inputAction,
  FocusNode? focusNode,
  void Function()? onTap,
}) {
  return TextField(
    autofocus: false,
    enabled: !isDisable,
    obscureText: isSecret,
    minLines: minLines,
    maxLines: maxlines,
    cursorColor: ConfigColor.secondaryColor,
    decoration: defaultInputDecor().copyWith(
        labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.grey.shade700),
        hintText: hint,
        labelText: label,
        errorText: errorText == '' ? null : errorText,
        // filled: controller.text.isNotEmpty,
        suffixIcon: suffixIcon),
    controller: controller,
    onChanged: onChanged,
    inputFormatters: inputFormats,
    keyboardType: inputType,
    focusNode: focusNode,
    onTap: onTap,
    textInputAction: inputAction,
  );
}

class AutoCompleteTxtField<T> extends StatelessWidget {
  final bool hideKeyboard;
  final bool hideSuggestionsOnKeyboardHide;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool enabled;
  final int maxLines;
  final TextEditingController controller;
  final Widget? suffixWidget;
  final String? label;
  final String? hint;
  final String? errorText;
  final SuggestionsCallback<T> callback;
  final ItemBuilder<T> builder;
  final ErrorBuilder? errorBuilder;
  final SuggestionSelectionCallback<T> onSuggestionSelected;
  final Widget Function(BuildContext, Widget, AnimationController?)?
      transitionBuilder;
  final InputDecoration? inputDecoration;

  AutoCompleteTxtField({
    this.hideKeyboard = false,
    this.hideSuggestionsOnKeyboardHide = false,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.enabled = true,
    this.maxLines = 1,
    required this.controller,
    this.suffixWidget,
    this.label,
    this.hint,
    this.errorText,
    required this.callback,
    required this.builder,
    this.errorBuilder,
    required this.onSuggestionSelected,
    this.transitionBuilder,
    this.inputDecoration,
  });
  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
        hideKeyboard: hideKeyboard,
        debounceDuration: const Duration(milliseconds: 700),
        hideSuggestionsOnKeyboardHide: hideSuggestionsOnKeyboardHide,
        textFieldConfiguration: TextFieldConfiguration(
          onTap: onTap,
          focusNode: focusNode,
          onChanged: onChanged,
          enabled: enabled,
          maxLines: maxLines,
          controller: controller,
          decoration: inputDecoration ??
              defaultInputDecor().copyWith(
                suffixIcon: suffixWidget,
                labelText: label,
                hintText: hint,
                errorText: errorText == '' ? null : errorText,
                // filled: controller.text.isNotEmpty,
              ),
        ),
        suggestionsCallback: callback,
        itemBuilder: builder,
        onSuggestionSelected: onSuggestionSelected,
        transitionBuilder: transitionBuilder,
        loadingBuilder: (context) =>
            const ListTile(dense: true, title: Center(child: CircularProgressIndicator())),
        errorBuilder: errorBuilder ??
            (_, e) {
              print(e.toString());
              return ListTile(
                title: const Text('Error', style: TextStyle(color: Colors.red)),
                subtitle: Text(e.toString(),
                    style: const TextStyle(color: Colors.red)),
              );
            });
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
