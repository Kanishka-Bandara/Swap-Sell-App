import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/message/Message.dart';

class MessageController extends Model {
  static MessageController defaultMessageController = MessageController();
  List<Message> _sentMessageList = [];
  List<Message> _receivedMessageList = [];

  Future<List<Message>> get sentMessageList async {
    return Future.delayed(Duration(seconds: 2), () => _sentMessageList);
  }

  Future<List<Message>> get receivedMessageList async {
    return Future.delayed(Duration(seconds: 2), () => _receivedMessageList);
  }
}