import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swap_sell/api_manager/url_holder.dart';
import 'package:swap_sell/model/user/user.dart';

class UserManagerAPI {
  static UserManagerAPI defaultManager = UserManagerAPI();
  Future<List<Map<String, String>>> getAllUserTitles() async {
    List<Map<String, String>> c = [];
    var response = await http.get(URLHolder.ALL_USER_TITLES_LIST_URL);
    if (response.statusCode == 200) {
      var x = await jsonDecode(response.body);
      for (var i = 0; i < x.length; i++) {
        Map<String, String> m = {};
        m["id"] = x[i]["id"];
        m["title"] = x[i]["title"];
        c.add(m);
      }
    }
    return c;
  }

  Future<User> saveUser(User u) async {
    var response = await http.post(
      URLHolder.USER_CREATE_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(u),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }else if(response.statusCode == 202) {
      
    }
    return null;
  }

  Future<Map> saveUserImage(Map<String,String> request) async {
    print(jsonEncode(request));
    print("/n/n");
    var response = await http.post(
      URLHolder.USER_UPDATE_PROFILE_PICTURE_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }else if(response.statusCode == 202) {
      
    }
    return null;
  }
}
