// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatedUser _$AuthenticatedUserFromJson(Map<String, dynamic> json) {
  return AuthenticatedUser(
    id: json['id'] as int,
    userId: json['userId'] as int,
    sessionId: json['sessionId'] as String,
    logInAt: json['logInAt'] == null
        ? null
        : DateTime.parse(json['logInAt'] as String),
    logOutAt: json['logOutAt'] == null
        ? null
        : DateTime.parse(json['logOutAt'] as String),
    userName: json['userName'] as String,
    password: json['password'] as String,
    facebookId: json['facebookId'] as String,
    googleId: json['googleId'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$AuthenticatedUserToJson(AuthenticatedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sessionId': instance.sessionId,
      'logInAt': instance.logInAt?.toIso8601String(),
      'logOutAt': instance.logOutAt?.toIso8601String(),
      'userName': instance.userName,
      'password': instance.password,
      'facebookId': instance.facebookId,
      'googleId': instance.googleId,
      'status': instance.status,
    };
