import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/api_manager/user_api_manager.dart';
import 'package:swap_sell/controller/appconfig/ImageController.dart';
import 'package:swap_sell/model/user/user.dart';

class UserController extends Model {
  static UserController defaultUserController = UserController();

  Future<User> createUser(User user) async {
    User newUser = await UserManagerAPI.defaultManager.saveUser(user);
    return newUser;
  }

  Future<User> editUser(User user, int userID) async {
    User editedUser = await UserManagerAPI.defaultManager.editUser(user);
    return editedUser;
  }

  Future<bool> deleteUser(int userID) async {
    //TODO:Edit User on backend
    return true;
  }

  Future<User> getUser(int userID) async {
    User user = await UserManagerAPI.defaultManager.getUser(userID);
    return user;
  }

  Future<User> editUserImage(File f, User user) async {
    // user.setProfilePicUrl =
    //     "https://ubistatic19-a.akamaihd.net/ubicomstatic/en-us/global/game-info/naked_boxshot_mobile_138233.jpg";
    Map<String, String> request = {};
    request["data"] = ImageController.dfaultController.encodeImageToBase64(f);
    request["profilePicName"] = "." + f.path.split(".").last;
    request["userId"] = user.getId.toString();
    Map<String, dynamic> response =
        await UserManagerAPI.defaultManager.saveUserImage(request);
    user.setProfilePicUrl = response["profilePicUrl"];
    return user;
  }

  Future<List<DropdownMenuItem<String>>> getUserTitleList() async {
    List<DropdownMenuItem<String>> rl = [];
    var l = await UserManagerAPI.defaultManager.getAllUserTitles();
    l.forEach((m) {
      rl.add(
        DropdownMenuItem(
          child: Row(
            children: <Widget>[
              Text(m["title"]),
            ],
          ),
          value: m["title"],
        ),
      );
    });
    return rl;
  }

  Future<List<DropdownMenuItem<String>>> getGenderList() async {
    print("called getGenderList");
    List<DropdownMenuItem<String>> rl = [];
    var l = await UserManagerAPI.defaultManager.getGenderList();
    l.forEach((m) {
      rl.add(
        DropdownMenuItem(
          child: Row(
            children: <Widget>[
              Text(m["gender"]),
            ],
          ),
          value: m["gender"],
        ),
      );
    });
    return rl;
  }
}
