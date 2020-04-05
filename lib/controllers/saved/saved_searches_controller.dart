import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/saved/saved_search.dart';

class SavedSearchesController extends Model {
  static SavedSearchesController defaultController = SavedSearchesController();
  List<SavedSearch> _savedList = [
    SavedSearch(
      id: 0,
      query: "Alisha",
      serachedAt: DateTime(2019, 5, 2, 11, 15, 20),
      savedAt: DateTime(2019, 5, 2, 11, 15, 20),
      status: 1,
    ),
    SavedSearch(
      id: 1,
      query: "Solid",
      serachedAt: DateTime(2020, 1, 2, 11, 15, 20),
      savedAt: DateTime(2020, 1, 2, 11, 15, 20),
      status: 1,
    ),
    SavedSearch(
      id: 2,
      query: "Carrel",
      serachedAt: DateTime(2020, 4, 1, 13, 59, 00),
      savedAt: DateTime(2020, 4, 1, 13, 59, 00),
      status: 1,
    ),
  ];

  Future<List<SavedSearch>> getSavedList() async {
    return Future.delayed(Duration(seconds: 2), () => _savedList);
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
      SavedSearch oldSavedSearch, SavedSearch newSavedSearch, int index) async {
    bool status = true;
    //Send to backend
    if (status) {
      _savedList[index] = newSavedSearch;
      notifyListeners();
    }
    return status;
  }

  Future<bool> removeFromSavedList(SavedSearch savedSearch, int index) async {
    bool status = true;
    //Send to backend
    if (status) {
      _savedList.removeAt(index);
      notifyListeners();
    }
    return status;
  }

  int getSavedListLength() {
    return _savedList.length;
  }
}
