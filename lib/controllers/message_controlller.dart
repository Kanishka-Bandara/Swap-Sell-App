import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/message/Message.dart';

class MessageController extends Model {
  static MessageController defaultMessageController = MessageController();
  List<List<Message>> _messageList = [];
  List<List<Message>> _archivedMessageList = [];

  Future<List<List<Message>>> get messageList async {
    return Future.delayed(Duration(seconds: 2), () => _messageList);
  }

  Future<List<List<Message>>> get archivedMessageList async {
    return Future.delayed(Duration(seconds: 2), () => _archivedMessageList);
  }

  bool get isEmptyMessageList {
    return _messageList.length == 0;
  }
}