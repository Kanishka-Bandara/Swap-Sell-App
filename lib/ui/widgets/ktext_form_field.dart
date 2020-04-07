import 'package:flutter/material.dart';

class KTextFormField extends TextFormField {
  KTextFormField({
    @required String name,
    String regExp,
    @required String emptyRequiredMessage,
    String regExpErrorMessage,
    @required FormFieldSetter<String> onSaved,
    Widget prefix,
    Widget suffix,
    bool obscureText = false,
  }) : super(
          decoration: InputDecoration(
              labelText: name, prefixIcon: prefix, suffixIcon: suffix),
          validator: (regExp == null || regExpErrorMessage == null)
              ? (String value) {
                  if (value.isEmpty) {
                    return emptyRequiredMessage == null
                        ? "This field is Required"
                        : emptyRequiredMessage;
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
          obscureText: obscureText,
        );
}
