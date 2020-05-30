import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/api_manager/shop_api_manager.dart';
import 'package:swap_sell/model/shop/shop.dart';

class ShopController extends Model {
  static ShopController defaultController = ShopController();

  Future<Shop> createShop(Shop shop) async {
    Shop newShop = await ShopApiManager.defaultManager.saveShop(shop);
    return newShop;
  }

  Future<Shop> editShop(Shop shop, int shopID) async {
    Shop editedShop = await ShopApiManager.defaultManager.editShop(shop);
    return editedShop;
  }

  Future<bool> deleteShop(int shopID) async {
    //TODO:Edit Shop on backend
    return true;
  }

  Future<Shop> getShopById(int shopID) async {
    Shop shop = await ShopApiManager.defaultManager.getById(shopID);
    return shop;
  }

  Future<Shop> getShopByUserId(int userId) async {
    Shop shop = await ShopApiManager.defaultManager.getByUserId(userId);
    return shop;
  }
}
