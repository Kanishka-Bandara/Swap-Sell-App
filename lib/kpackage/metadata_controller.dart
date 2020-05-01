import 'package:flutter/material.dart';

abstract class MetaDataController<T> {
  Map<T, String> _indexMap;

  MetaDataController(this._indexMap);

  String getNameByIndex(T index) {
    return _indexMap[index];
  }

  String getNameByIndexNumber(int indexNumber){
    String _c;
    _indexMap.forEach((dynamic k, v) {
      if (indexNumber == k.index) {
        _c = v;
        return;
      }
    });
    return _c;
  }

  int getIndexNumberByName(String name){
    int _k;
    _indexMap.forEach((dynamic k, v) {
      if (name == v) {
        _k = k.index;
        return;
      }
    });
    return _k;
  }

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
