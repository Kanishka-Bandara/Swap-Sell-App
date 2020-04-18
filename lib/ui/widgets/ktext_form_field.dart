import 'package:flutter/material.dart';

class KTextFormField extends TextFormField {
  final TextEditingController textController = TextEditingController();
  KTextFormField({
    @required String name,
    String regExp,
    @required String emptyRequiredMessage,
    String regExpErrorMessage,
    @required FormFieldSetter<String> onSaved,
    Widget prefix,
    Widget suffix,
    bool obscureText = false,
    bool isMultiLine = false,
    int maxLines = 1,
    TextEditingController textController,
    bool required = false,
    GestureTapCallback onTap,
    ValueChanged<String> onChanged,
  }) : super(
          decoration: InputDecoration(
            labelText: name,
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
          validator: (regExp == null || regExpErrorMessage == null)
              ? (String value) {
                  if (required) {
                    if (value.isEmpty) {
                      return emptyRequiredMessage == null
                          ? "This field is Required"
                          : emptyRequiredMessage;
                    }
                  }
                  return null;
                }
              : (String value) {
                  if (value.isEmpty) {
                    return emptyRequiredMessage == null
                        ? "This field is Required"
                        : emptyRequiredMessage;
                  }
                  if (!RegExp(regExp).hasMatch(value)) {
                    return regExpErrorMessage;
                  }
                  return null;
                },
          onSaved: onSaved,
          onTap: onTap,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: isMultiLine ? TextInputType.multiline : null,
          maxLines: maxLines,
          controller: textController,
        );

  void clear() {
    this.textController.clear();
  }
}
