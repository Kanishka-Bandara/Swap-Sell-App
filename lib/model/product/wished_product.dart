import 'package:swap_sell/model/product/product.dart';

class WishedProduct {
  int id;
  Product product;
  DateTime savedAt;
  int status;

  WishedProduct({
    this.id,
    this.product,
    this.savedAt,
    this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  Product get getProduct => this.product;

  set setProduct(Product product) => this.product = product;

  DateTime get getSavedAt => this.savedAt;

  set setSavedAt(DateTime savedAt) => this.savedAt = savedAt;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
