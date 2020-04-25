import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/message/message.dart';
import 'package:swap_sell/model/message/message_metadata.dart';
import 'package:swap_sell/model/message/user_message.dart';
import 'package:swap_sell/model/user/email.dart';
import 'package:swap_sell/model/user/user.dart';

class MessageController extends Model {
  static MessageController defaultMessageController = MessageController();
  List<UserMessage> _messageList = [];
  List<UserMessage> _archivedMessageList = [];

  MessageController() {
    _loadMessagesList();
    _loadArchivedMessagesList();
  }

  Future<List<UserMessage>> get getMessageList async {
    return Future.delayed(Duration(seconds: 1), () => _messageList);
  }

  Future<List<UserMessage>> get getReceivedMessageList async {
    return Future.delayed(Duration(seconds: 1), () => _archivedMessageList);
  }

  bool get isEmptyMessageList {
    return _messageList.length == 0;
  }

  bool get isEmptyArchivedMessageList {
    return _archivedMessageList.length == 0;
  }

  int get getAllUnreadMessagesCount {
    int _count = 0;
    _messageList.forEach((UserMessage um) {
      _count += um.getUnreadMessageCount;
    });
    return _count;
  }

  bool sendMessage(Message message, User receiver) {
    bool status = true;
    //Send Message To the backend
    if (status) {
      for (var i = 0; i < _messageList.length; i++) {}
    }
    return status;
  }

  void _loadMessagesList() {
    _messageList.add(
      UserMessage(
        receivedBy: User(
          id: 1,
          userId: "u0001",
          title: "Mr.",
          gender: "Male",
          fName: "Kanishka",
          lName: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          emails: <Email>[
            Email(
              emailID: 1,
              emailType: "Primary",
              email: "wmkubandara@gmail.com",
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
          title: "Mr.",
          gender: "Male",
          fName: "Kanishka",
          lName: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          profilePicUrl:
              "https://i.pinimg.com/originals/54/e4/f8/54e4f81799a09dc219ed6ff22d327efd.jpg",
          emails: <Email>[
            Email(
              emailID: 1,
              emailType: "Primary",
              email: "wmkubandara@gmail.com",
              status: 1,
            )
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        messageList: [
          Message(
            id: 1,
            category: MessageType.RECEIVED_MESSAGE,
            message:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit iaculis rhoncus. Proin imperdiet enim eget nulla malesuada, et elementum odio porta. Nunc ultrices orci sed erat ullamcorper efficitur. Maecenas vel elementum urna. Donec et pretium eros. Aliquam faucibus sollicitudin felis, nec feugiat lorem semper a. Mauris metus ipsum, pharetra eu odio a, suscipit tempor magna. In id iaculis mauris.",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            status: MessageStatus.LIVE_MESSAGE,
            read: true,
          ),
          Message(
            id: 2,
            category: MessageType.RECEIVED_MESSAGE,
            message: "How about the ",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            status: MessageStatus.LIVE_MESSAGE,
            read: false,
          ),
          Message(
            id: 3,
            category: MessageType.RECEIVED_MESSAGE,
            message: "",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            status: MessageStatus.LIVE_MESSAGE,
            read: false,
          ),
        ],
      ),
    );
    _messageList.add(
      UserMessage(
        receivedBy: User(
          id: 1,
          userId: "u0001",
          title: "Mr.",
          gender: "Male",
          fName: "Kanishka",
          lName: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          emails: <Email>[
            Email(
              emailID: 1,
              emailType: "Primary",
              email: "wmkubandara@gmail.com",
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
          title: "Mr.",
          gender: "Male",
          fName: "Kanishka",
          lName: "Bandara",
          fullName: "Kanishka Udayakantha Bandara",
          emails: <Email>[
            Email(
              emailID: 1,
              emailType: "Primary",
              email: "wmkubandara@gmail.com",
              status: 1,
            )
          ],
          country: "Sri Lanka",
          activeState: 1,
          status: 1,
        ),
        messageList: [
          Message(
            id: 1,
            category: MessageType.SENT_MESSAGE,
            message:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit iaculis rhoncus. Proin imperdiet enim eget nulla malesuada, et elementum odio porta. Nunc ultrices orci sed erat ullamcorper efficitur. Maecenas vel elementum urna. Donec et pretium eros. Aliquam faucibus sollicitudin felis, nec feugiat lorem semper a. Mauris metus ipsum, pharetra eu odio a, suscipit tempor magna. In id iaculis mauris.",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            status: MessageStatus.LIVE_MESSAGE,
            read: true,
          ),
          Message(
            id: 2,
            category: MessageType.RECEIVED_MESSAGE,
            message: "Hey",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            status: MessageStatus.LIVE_MESSAGE,
            read: true,
          ),
          Message(
            id: 3,
            category: MessageType.RECEIVED_MESSAGE,
            message: "Hey",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            status: MessageStatus.LIVE_MESSAGE,
            read: false,
          ),
        ],
      ),
    );
  }

  void _loadArchivedMessagesList() {}
}
