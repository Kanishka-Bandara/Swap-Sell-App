import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swap_sell/api_manager/url_holder.dart';
import 'package:swap_sell/model/message/message.dart';
import 'package:swap_sell/model/message/message_metadata.dart';
import 'package:swap_sell/model/message/user_message.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';
import 'package:swap_sell/model/user/email.dart';
import 'package:swap_sell/model/user/user.dart';
import 'package:swap_sell/model/user/usertype_metadata.dart';

class MessageApiManager {
  static MessageApiManager defaultManager = MessageApiManager();

  Future<List<UserMessage>> getMessageList(int userId) async {
    // var response = await http.get(URLHolder.GET_MESSAGE_LIST_URL + "/$userId");
    // if (response.statusCode == 200) {
    //   return null;
    //   // return Message.fromJson(json.decode(response.body));
    // } else {
    //   return null;
    // }
    return Future.delayed(Duration(seconds: 10), () => _loadMessagesList());
  }

  Future<List<UserMessage>> getArchivedMessageList(int userId) async {
    // var response = await http.get(URLHolder.GET_MESSAGE_LIST_URL + "/$userId");
    // if (response.statusCode == 200) {
    //   return null;
    //   // return Message.fromJson(json.decode(response.body));
    // } else {
    //   return null;
    // }
    return Future.delayed(
        Duration(seconds: 10), () => _loadArchivedMessagesList());
  }

  Future<bool> sendMessage(UserMessage m) async {
    return true;
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

  Future<bool> setMessagesAsRead(int userId, List<int> ids) async {
    return true;
    // var response = await http.post(
    //   URLHolder.SET_MESSAGES_AS_READ_URL + "/$userId",
    //   headers: <String, String>{
    //     'Content-Type': 'application/json',
    //   },
    //   body: jsonEncode(<String, List<int>>{
    //     'ids': ids,
    //   }),
    // );
    // if (response.statusCode == 200) {
    //   List r = json.decode(response.body);
    //   List<UserMessage> res = [];
    //   r.forEach((element) {
    //     res.add(UserMessage.fromJson(element));
    //   });
    //   return res;
    // } else {
    //   return null;
    // }
  }

  Future<bool> deleteMessages(int userId, List<int> ids) async {
    return true;
    // var response = await http.post(
    //   URLHolder.SET_MESSAGES_AS_READ_URL + "/$userId",
    //   headers: <String, String>{
    //     'Content-Type': 'application/json',
    //   },
    //   body: jsonEncode(<String, List<int>>{
    //     'ids': ids,
    //   }),
    // );
    // if (response.statusCode == 200) {
    //   bool r = json.decode(response.body);
    //   return r;
    // } else {
    //   return false;
    // }
  }

  List<UserMessage> _loadMessagesList() {
    List<UserMessage> _messageList = [];
    _messageList.add(
      UserMessage(
        receivedBy: User(
          id: 1,
          userId: "u0001",
          userType: UserType.SELLER_AND_BUYER,
          title: "Mr.",
          gender: "Male",
          fname: "Kanishka",
          lname: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          emails: <Email>[
            Email(
              id: 1,
              emailType: EmailType.MESSAGES,
              isDefault: 1,
              email: "wmkubandara@gmail.com",
              emailTypeId: 1,
              userId: EmailType.MESSAGES.index,
              status: 1,
            )
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        sentBy: User(
          id: 1,
          userId: "u0001",
          userType: UserType.SELLER_AND_BUYER,
          title: "Mr.",
          gender: "Male",
          fname: "Kanishka",
          lname: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          profilePicUrl:
              "https://i.pinimg.com/originals/54/e4/f8/54e4f81799a09dc219ed6ff22d327efd.jpg",
          emails: <Email>[
            Email(
                id: 1,
                emailType: EmailType.MESSAGES,
                isDefault: 1,
                email: "wmkubandara@gmail.com",
                status: 1,
                emailTypeId: EmailType.MESSAGES.index,
                userId: 1)
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        messageList: [
          Message(
            id: 1,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit iaculis rhoncus. Proin imperdiet enim eget nulla malesuada, et elementum odio porta. Nunc ultrices orci sed erat ullamcorper efficitur. Maecenas vel elementum urna. Donec et pretium eros. Aliquam faucibus sollicitudin felis, nec feugiat lorem semper a. Mauris metus ipsum, pharetra eu odio a, suscipit tempor magna. In id iaculis mauris.",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 0,
            status: 1,
          ),
          Message(
            id: 2,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message: "How about the ",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 0,
            status: 1,
          ),
          Message(
            id: 3,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message: "",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 0,
            status: 1,
          ),
        ],
      ),
    );
    _messageList.add(
      UserMessage(
        receivedBy: User(
          id: 1,
          userId: "u0001",
          userType: UserType.SELLER_AND_BUYER,
          title: "Mr.",
          gender: "Male",
          fname: "Kanishka",
          lname: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          emails: <Email>[
            Email(
                id: 1,
                emailType: EmailType.MESSAGES,
                isDefault: 1,
                email: "wmkubandara@gmail.com",
                status: 1,
                emailTypeId: EmailType.MESSAGES.index,
                userId: 1)
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        sentBy: User(
          id: 1,
          userId: "u0001",
          userType: UserType.SELLER_AND_BUYER,
          title: "Mr.",
          gender: "Male",
          fname: "Kanishka",
          lname: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          emails: <Email>[
            Email(
                id: 1,
                emailType: EmailType.MESSAGES,
                isDefault: 1,
                email: "wmkubandara@gmail.com",
                status: 1,
                emailTypeId: EmailType.MESSAGES.index,
                userId: 1)
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        messageList: [
          Message(
            id: 1,
            categoryId: MessageType.SENT_MESSAGE.index,
            category: MessageType.SENT_MESSAGE,
            message:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit iaculis rhoncus. Proin imperdiet enim eget nulla malesuada, et elementum odio porta. Nunc ultrices orci sed erat ullamcorper efficitur. Maecenas vel elementum urna. Donec et pretium eros. Aliquam faucibus sollicitudin felis, nec feugiat lorem semper a. Mauris metus ipsum, pharetra eu odio a, suscipit tempor magna. In id iaculis mauris.",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 1,
            status: 1,
          ),
          Message(
            id: 2,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message: "Hey",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 1,
            status: 1,
          ),
          Message(
            id: 3,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message: "Hey",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 0,
            status: 1,
          ),
        ],
      ),
    );
    return _messageList;
  }

  List<UserMessage> _loadArchivedMessagesList() {
    List<UserMessage> _messageList = [];
    _messageList.add(
      UserMessage(
        receivedBy: User(
          id: 1,
          userId: "u0001",
          userType: UserType.SELLER_AND_BUYER,
          title: "Mr.",
          gender: "Male",
          fname: "Kanishka",
          lname: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          emails: <Email>[
            Email(
              id: 1,
              emailType: EmailType.MESSAGES,
              isDefault: 1,
              email: "wmkubandara@gmail.com",
              emailTypeId: 1,
              userId: EmailType.MESSAGES.index,
              status: 1,
            )
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        sentBy: User(
          id: 1,
          userId: "u0001",
          userType: UserType.SELLER_AND_BUYER,
          title: "Mr.",
          gender: "Male",
          fname: "Kanishka",
          lname: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          profilePicUrl:
              "https://i.pinimg.com/originals/54/e4/f8/54e4f81799a09dc219ed6ff22d327efd.jpg",
          emails: <Email>[
            Email(
                id: 1,
                emailType: EmailType.MESSAGES,
                isDefault: 1,
                email: "wmkubandara@gmail.com",
                status: 1,
                emailTypeId: EmailType.MESSAGES.index,
                userId: 1)
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        messageList: [
          Message(
            id: 1,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit iaculis rhoncus. Proin imperdiet enim eget nulla malesuada, et elementum odio porta. Nunc ultrices orci sed erat ullamcorper efficitur. Maecenas vel elementum urna. Donec et pretium eros. Aliquam faucibus sollicitudin felis, nec feugiat lorem semper a. Mauris metus ipsum, pharetra eu odio a, suscipit tempor magna. In id iaculis mauris.",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 1,
            status: 1,
          ),
          Message(
            id: 2,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message: "How about the ",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 0,
            status: 1,
          ),
          Message(
            id: 3,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message: "",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 1,
            status: 1,
          ),
        ],
      ),
    );
    _messageList.add(
      UserMessage(
        receivedBy: User(
          id: 1,
          userId: "u0001",
          userType: UserType.SELLER_AND_BUYER,
          title: "Mr.",
          gender: "Male",
          fname: "Kanishka",
          lname: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          emails: <Email>[
            Email(
                id: 1,
                emailType: EmailType.MESSAGES,
                isDefault: 1,
                email: "wmkubandara@gmail.com",
                status: 1,
                emailTypeId: EmailType.MESSAGES.index,
                userId: 1)
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        sentBy: User(
          id: 1,
          userId: "u0001",
          userType: UserType.SELLER_AND_BUYER,
          title: "Mr.",
          gender: "Male",
          fname: "Kanishka",
          lname: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          emails: <Email>[
            Email(
                id: 1,
                emailType: EmailType.MESSAGES,
                isDefault: 1,
                email: "wmkubandara@gmail.com",
                status: 1,
                emailTypeId: EmailType.MESSAGES.index,
                userId: 1)
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        messageList: [
          Message(
            id: 1,
            categoryId: MessageType.SENT_MESSAGE.index,
            category: MessageType.SENT_MESSAGE,
            message:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit iaculis rhoncus. Proin imperdiet enim eget nulla malesuada, et elementum odio porta. Nunc ultrices orci sed erat ullamcorper efficitur. Maecenas vel elementum urna. Donec et pretium eros. Aliquam faucibus sollicitudin felis, nec feugiat lorem semper a. Mauris metus ipsum, pharetra eu odio a, suscipit tempor magna. In id iaculis mauris.",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 1,
            status: 1,
          ),
          Message(
            id: 2,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message: "Hey",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 1,
            status: 1,
          ),
          Message(
            id: 3,
            categoryId: MessageType.RECEIVED_MESSAGE.index,
            category: MessageType.RECEIVED_MESSAGE,
            message: "Hey",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            messageStatusId: MessageStatus.LIVE_MESSAGE.index,
            messageStatus: MessageStatus.LIVE_MESSAGE,
            read: 0,
            status: 1,
          ),
        ],
      ),
    );
    return _messageList;
  }
}
