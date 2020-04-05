import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/saved/saved_shop.dart';

class SavedShopsController extends Model {
  static SavedShopsController defaultController = SavedShopsController();
  List<SavedShop> _savedList = [];

  Future<List<SavedShop>> getSavedList() async {
    return _savedList;
  }

  Future<bool> addToSavedList(SavedShop savedSearch) async {
    bool status = true;
    //Send to backend
    if (status) {
      _savedList.add(savedSearch);
      notifyListeners();
      status = true;
    } else {
      status = false;
    }
    return status;
  }

  Future<bool> updateFromSavedList(
      SavedShop oldSavedSearch, SavedShop newSavedSearch) async {
    bool status = true;
    //Send to backend
    if (status) {
      for (var i = 0; i < _savedList.length; i++) {
        if (_savedList[i].id == oldSavedSearch.id) {
          _savedList[i] = newSavedSearch;
        }
      }
      notifyListeners();
    }
    return status;
  }

  Future<bool> removeFromSavedList(SavedShop savedSearch) async {
    bool status = true;
    //Send to backend
    if (status) {
      for (var i = 0; i < _savedList.length; i++) {
        if (_savedList[i].id == savedSearch.id) {
          _savedList.removeAt(i);
        }
      }
      notifyListeners();
    }
    return status;
  }
}
