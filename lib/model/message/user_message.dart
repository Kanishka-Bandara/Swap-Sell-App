import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/message/message.dart';
import 'package:swap_sell/model/user/user.dart';

class UserMessage extends Model{
  User receivedBy;
  User sentBy;
  int unreadMessageCount;
  List<Message> messageList = [];
  UserMessage(
      {@required this.receivedBy,
      @required this.sentBy,
      this.messageList,
      this.unreadMessageCount});

  User get getReceivedUser => this.receivedBy;

  set setReceivedUser(User receivedUser) => this.receivedBy = receivedUser;

  User get getSentUser => this.sentBy;

  set setSentUser(User sentUser) => this.sentBy = sentUser;

  List<Message> get getMessageList => this.messageList;

  set setMessageList(List<Message> messages) => this.messageList = messages;

  int get getUnreadMessageCount => unreadMessageCount;

  set setUnreadMessageCount(int unreadMessageCount) =>
      this.unreadMessageCount = unreadMessageCount;

  addMessage(Message message) {
    messageList.add(message);
  }
}
