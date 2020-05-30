import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/api_manager/message_api_manager.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/model/message/message.dart';
import 'package:swap_sell/model/message/user_message.dart';
import 'package:swap_sell/model/user/user.dart';

class MessageController extends Model {
  static MessageController defaultMessageController = MessageController();
  List<UserMessage> _messageList = [];
  List<UserMessage> _archivedMessageList = [];
  bool _isMessageListLoading = false;
  bool _isArchivedMessageListLoading = false;

// BEGIN::Getters & setters for instance variables

  set setMessageList(List<UserMessage> _list) => this._messageList = _list;

  Future<List<UserMessage>> get getMessageList async {
    return _messageList;
  }

  set setArchivedMessageList(List<UserMessage> _list) =>
      this._archivedMessageList = _list;

  Future<List<UserMessage>> get getArchivedMessageList async {
    return _archivedMessageList;
  }

  bool get isLoadingMessageList => this._isMessageListLoading;

  set setLoadingMessageList(bool state) {
    this._isMessageListLoading = state;
    notifyListeners();
  }

  bool get isLoadingArchivedMessageList => this._isArchivedMessageListLoading;

  set setLoadingArchivedMessageList(bool state) {
    this._isArchivedMessageListLoading = state;
    notifyListeners();
  }

// END::Getters & setters for instance variables

// BEGIN::Methods connect with API Manager to fullfill main tasks of the controller

  Future<List<UserMessage>> fetchMessageList() async {
    _messageList = [];
    if (!AppInit.currentApp.currentUserState) {
      return[];
    }
    this.setLoadingMessageList = true;
    List<UserMessage> l = await MessageApiManager.defaultManager
        .getMessageList(AppInit.currentApp.getCurrentUser.getId);
    l.forEach((element) {
      _messageList.add(element);
    });
    notifyListeners();
    this.setLoadingMessageList = false;
    return _messageList;
  }

  Future<bool> sendMessage(Message message, User receiver) async {
    bool status = await MessageApiManager.defaultManager.sendMessage(
      UserMessage(
          receivedBy: receiver,
          sentBy: AppInit.currentApp.getCurrentUser,
          messageList: [message]),
    );
    return status;
  }

  Future<bool> setUnreadMessagesAsRead(List<int> ids) async {
    bool status = await MessageApiManager.defaultManager.setMessagesAsRead(
      AppInit.currentApp.getCurrentUser.getId,
      ids,
    );
    notifyListeners();
    return status;
  }

// END::Methods connect with API Manager to fullfill main tasks of the controller

// BEGIN::Sopportive methods for controller

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

// END::Sopportive methods for controller
}
