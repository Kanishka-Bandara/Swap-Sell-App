import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/saved/saved_search.dart';

class SavedSearchesController extends Model {
  static SavedSearchesController defaultController;
  List<SavedSearch> _savedList;

  Future<List<SavedSearch>> getSavedList() async {
    return _savedList;
  }

  Future<bool> addToSavedList(SavedSearch savedSearch) async {
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
      SavedSearch oldSavedSearch, SavedSearch newSavedSearch) async {
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

  Future<bool> removeFromSavedList(SavedSearch savedSearch) async {
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