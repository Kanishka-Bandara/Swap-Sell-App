import 'package:flutter/material.dart';

class KTextFormField extends TextFormField {
  final TextEditingController textController = TextEditingController();
  KTextFormField({
    String name,
    String regExp,
    String emptyRequiredMessage,
    String regExpErrorMessage,
    FormFieldSetter<String> onSaved,
    Widget prefix,
    Widget suffix,
    bool obscureText = false,
    bool isMultiLine = false,
    int maxLines = 1,
    TextEditingController textController,
    bool required = false,
    GestureTapCallback onTap,
    ValueChanged<String> onChanged,
    String initialValue,
    bool enabled = true,
    FormFieldValidator<String> validator,
    String errorText,
  }) : super(
          decoration: InputDecoration(
            labelText: name,
            prefixIcon: prefix,
            suffixIcon: suffix,
            errorText: errorText,
          ),
          validator:validator!=null? validator:(regExp == null || regExpErrorMessage == null)
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
          initialValue: initialValue,
          enabled: enabled,
        );

  void clear() {
    this.textController.clear();
  }
}
