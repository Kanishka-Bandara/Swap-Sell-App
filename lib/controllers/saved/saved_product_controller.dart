import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/saved/saved_product.dart';

class SavedProductsController extends Model {
  static SavedProductsController defaultController = SavedProductsController();
  List<SavedProduct> _savedList = [];

  Future<List<SavedProduct>> getSavedList() async {
    return Future.delayed(Duration(seconds: 2), () => _savedList);
  }

  Future<bool> addToSavedList(SavedProduct savedSearch) async {
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
      SavedProduct oldSavedProduct, SavedProduct newSavedProduct,int index) async {
    bool status = true;
    //Send to backend
    if (status) {
      _savedList[index] = newSavedProduct;
      notifyListeners();
    }
    return status;
  }

  Future<bool> removeFromSavedList(SavedProduct savedSearch,int index) async {
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
