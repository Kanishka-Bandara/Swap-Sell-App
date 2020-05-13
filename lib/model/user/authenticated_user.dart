
import 'package:json_annotation/json_annotation.dart';

part 'authenticated_user.g.dart';

@JsonSerializable()
class AuthenticatedUser {
  int id;
  int userId;
  String sessionId;
  DateTime logInAt;
  DateTime logOutAt;
  String userName;
  String password;
  String facebookId;
  String googleId;
  int status;

  AuthenticatedUser({
    this.id,
    this.userId,
    this.sessionId,
    this.logInAt,
    this.logOutAt,
    this.userName,
    this.password,
    this.facebookId,
    this.googleId,
    this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  int get getUserId => userId;

  set setUserId(int userId) => this.userId = userId;

  String get getSessionId => sessionId;

  set setSessionId(String sessionId) => this.sessionId = sessionId;

  String get getUserName => userName;

  set setLogInAt(DateTime logInAt) => this.logInAt = logInAt;

  DateTime get getLogInAt => logInAt;

  set setLogOutAt(DateTime logOutAt) => this.logOutAt = logOutAt;

  DateTime get getLogOutAt => logOutAt;

  set setUserName(String userName) => this.userName = userName;

  String get getPassword => password;

  set setPassword(String password) => this.password = password;

  String get getFacebookId => facebookId;

  set setFacebookId(String facebookId) => this.facebookId = facebookId;

  String get getGoogleId => googleId;

  set setGoogleId(String googleId) => this.googleId = googleId;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) => _$AuthenticatedUserFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticatedUserToJson(this);

}
