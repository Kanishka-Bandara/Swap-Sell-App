import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swap_sell/api_manager/url_holder.dart';
import 'package:swap_sell/model/shop/shop.dart';

class ShopApiManager {
  static ShopApiManager defaultManager = ShopApiManager();

  Future<Shop> saveShop(Shop u) async {
    var response = await http.post(
      URLHolder.SHOP_CREATE_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(u),
    );
    if (response.statusCode == 200) {
      return Shop.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 202) {}
    return null;
  }

  Future<Shop> editShop(Shop u) async {
    var response = await http.post(
      URLHolder.SHOP_EDIT_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(u),
    );
    if (response.statusCode == 200) {
      return Shop.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 202) {}
    return null;
  }

  Future<Shop> getByUserId(int userId) async {
    var response = await http.get(
      URLHolder.SHOP_GET_BY_USER_ID_URL + "/$userId",
    );
    if (response.statusCode == 200) {
      return Shop.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 202) {}
    return null;
  }

  Future<Shop> getById(int id) async {
    var response = await http.get(
      URLHolder.SHOP_GET_BY_ID_URL + "/$id",
    );
    if (response.statusCode == 200) {
      return Shop.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 202) {}
    return null;
  }
}
