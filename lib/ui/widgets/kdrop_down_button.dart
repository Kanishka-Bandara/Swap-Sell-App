import 'package:flutter/material.dart';

class KDropDownButton<T> extends DropdownButtonFormField {
  KDropDownButton({
    @required List<DropdownMenuItem<T>> items,
    @required ValueChanged<dynamic> onChanged,
    dynamic value,
    Widget hint,
    Widget disabledHint,
    String title
  }) : super(
          items: items,
          onChanged: onChanged,
          hint: hint,
          disabledHint: disabledHint,
          value: value,
          isExpanded:true,
          decoration:InputDecoration(labelText: title,)
        );
}
