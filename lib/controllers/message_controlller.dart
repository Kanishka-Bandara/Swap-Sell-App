import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/message/message.dart';
import 'package:swap_sell/model/message/message_category.dart';
import 'package:swap_sell/model/message/user_message.dart';
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
    return Future.delayed(Duration(seconds: 2), () => _messageList);
  }

  Future<List<UserMessage>> get getReceivedMessageList async {
    return Future.delayed(Duration(seconds: 2), () => _archivedMessageList);
  }

  bool get isEmptyMessageList {
    return _messageList.length == 0;
  } 

  bool get isEmptyArchivedMessageList {
    return _archivedMessageList.length == 0;
  }

  bool sendMessage(Message message,User receiver){
    bool status = true;
    //Send Message To the backend
    if (status) {
      for (var i = 0; i < _messageList.length; i++) {
        
      }
    }
    return status;
  }


  void _loadMessagesList() {
    _messageList.add(
      UserMessage(
        receivedBy: User(),
        sentBy: User(),
        messageList: [
          Message(
            id: 1,
            category: MessageCategory.RECEIVED_MESSAGE,
            message:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit iaculis rhoncus. Proin imperdiet enim eget nulla malesuada, et elementum odio porta. Nunc ultrices orci sed erat ullamcorper efficitur. Maecenas vel elementum urna. Donec et pretium eros. Aliquam faucibus sollicitudin felis, nec feugiat lorem semper a. Mauris metus ipsum, pharetra eu odio a, suscipit tempor magna. In id iaculis mauris.",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            status: 1,
          ),
        ],
      ),
    );
  }

  void _loadArchivedMessagesList() {}
}
