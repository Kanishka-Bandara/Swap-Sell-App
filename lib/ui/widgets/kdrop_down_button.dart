import 'package:flutter/material.dart';

class KDropDownButton<T> extends DropdownButton {
  KDropDownButton({
    @required List<DropdownMenuItem<T>> items,
    @required ValueChanged<dynamic> onChanged,
    dynamic value,
    Widget hint,
    Widget disabledHint,
  }) : super(
          items: items,
          onChanged: onChanged,
          hint: hint,
          disabledHint: disabledHint,
          value: value,
          isExpanded:true
        );
}
