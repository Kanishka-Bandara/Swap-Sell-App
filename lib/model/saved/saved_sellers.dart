import 'package:swap_sell/model/shop/shop.dart';

class SavedSeller {
  int id;
  Shop shop;
  DateTime savedAt;
  int status;

  SavedSeller({
    this.id,
    this.shop,
    this.savedAt,
    this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  Shop get getShop => this.shop;

  set setShop(Shop shop) => this.shop = shop;

  DateTime get getSavedAt => this.savedAt;

  set setSavedAt(DateTime savedAt) => this.savedAt = savedAt;
  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
