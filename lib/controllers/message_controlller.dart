import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/message/user_message.dart';

class MessageController extends Model {
  static MessageController defaultMessageController = MessageController();
  List<UserMessage> _messageList = [];
  List<UserMessage> _archivedMessageList = [];

  Future<List<UserMessage>> get messageList async {
    return Future.delayed(Duration(seconds: 2), () => _messageList);
  }

  Future<List<UserMessage>> get receivedMessageList async {
    return Future.delayed(Duration(seconds: 2), () => _archivedMessageList);
  }

  bool get isEmptyMessageList {
    return _messageList.length == 0;
  }

  bool get isEmptyArchivedMessageList {
    return _archivedMessageList.length == 0;
  }
}