import 'package:flutter/material.dart';

abstract class MetaDataController<T> {
  Map<T, String> _indexMap;

  MetaDataController(this._indexMap);

  String getNameByIndex(T index) {
    return _indexMap[index];
  }

  String getNameByIndexNumber(int indexNumber);

  int getIndexNumberByName(String name);

  T getIndexByName(String name) {
    T _c;
    _indexMap.forEach((k, v) {
      if (name == v) {
        _c = k;
        return;
      }
    });
    return _c;
  }

  List<DropdownMenuItem<T>> getNamesAsListForDropDown() {
    List<DropdownMenuItem<T>> l = [];
    _indexMap.forEach(
      (k, v) {
        l.add(
          DropdownMenuItem(
            child: Row(
              children: <Widget>[
                Text(getNameByIndex(k)),
              ],
            ),
            value: k,
          ),
        );
      },
    );
    return l;
  }
}
