import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swap_sell/api_manager/url_holder.dart';
import 'package:swap_sell/model/product/product.dart';

class ProductApiManager {
  static ProductApiManager defaultManager = ProductApiManager();

  Future<Product> saveProduct(Product p) async {
    // var response = await http.post(
    //   URLHolder.SEND_MESSAGE_URL,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json',
    //   },
    //   body: null,
    // );
    // if (response.statusCode == 200) {
    //   return null;
    //   // return Message.fromJson(json.decode(response.body));
    // } else {
    //   return null;
    // }
  }
}
