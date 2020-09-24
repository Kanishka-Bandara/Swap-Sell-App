import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/saved/saved_shop.dart';
import 'package:swap_sell/model/shop/shop.dart';

class SavedShopsController extends Model {
  static SavedShopsController defaultController = SavedShopsController();
  List<SavedShop> _savedList = [
    SavedShop(
      id: 1,
      savedAt: DateTime.now(),
      shop: Shop.exampleShop,
      status: 1,
    ),
  ];

  Future<List<SavedShop>> getSavedList() async {
    return Future.delayed(Duration(seconds: 2), () => _savedList);
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
      SavedShop oldSavedShop, SavedShop newSavedShop, int index) async {
    bool status = true;
    //Send to backend
    if (status) {
      _savedList[index] = newSavedShop;
      notifyListeners();
    }
    return status;
  }

  Future<bool> removeFromSavedList(SavedShop savedSearch, int index) async {
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
