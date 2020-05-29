import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swap_sell/api_manager/url_holder.dart';
import 'package:swap_sell/model/product/product.dart';

class ProductApiManager {
  static ProductApiManager defaultManager = ProductApiManager();

  Future<Product> saveProduct(Product p,int userId) async {
    print("sending data");
    var response = await http.post(
      URLHolder.CREATE_PRODUCT_URL+"/$userId",
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(p),
    );
    print(URLHolder.CREATE_PRODUCT_URL+"/$userId");
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}