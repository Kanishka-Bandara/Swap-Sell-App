import 'package:flutter/material.dart';
import 'package:swap_sell/controller/message_controlller.dart';
import 'package:swap_sell/model/message/message.dart';
import 'package:swap_sell/model/message/message_metadata.dart';
import 'package:swap_sell/model/message/user_message.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/message_components.dart';

class ChatView extends StatefulWidget {
  static UserMessage userMessage;
  @override
  State<StatefulWidget> createState() {
    return _ChatViewState(userMessage);
  }
}

class _ChatViewState extends State<ChatView> {
  UserMessage _userMessage;
  _ChatViewState(this._userMessage);
  String _currentMessage = "";
  ScrollController _scrollController;
  TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                child: _buildMessageBody(context),
              ),
            ),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(hintText: "Send a message"),
                    onChanged: (String value) {
                      setState(() {
                        _currentMessage = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: _sendMessage(),
                ),
              ],
            ),
          )
        ],
      ),
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "${_userMessage.getSentUser.getFName} ${_userMessage.getSentUser.getLName}",
        false,
        false,
        null,
        // Row(
        //   children: <Widget>[],
        // ),
      ),
    );
  }

  void _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  Widget _buildMessageBody(BuildContext contxt) {
    // return Column(
    //   children: <Widget>[
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        return MessageComponents.buildMessageRowTile(
            context, _userMessage.getMessageList[index]);
      },
      itemCount: _userMessage.getMessageList.length,
    );
    //   ],
    // );
  }

  _sendMessage() {
    if (_currentMessage != "") {
      Message m = Message(
        id: _userMessage.getMessageList.length,
        category: MessageType.SENT_MESSAGE,
        categoryId: MessageType.SENT_MESSAGE.index,
        message: _currentMessage,
        read: 1,
        viewedAt: null,
        sentAt: DateTime.now(),
        messageStatus: MessageStatus.LIVE_MESSAGE,
        messageStatusId: MessageStatus.LIVE_MESSAGE.index,
        status: 1,
      );
      _send(m);
    }
  }

  void _send(Message m) async {
    bool isSent = await MessageController.defaultMessageController
        .sendMessage(m, _userMessage.getReceivedUser);
    if (isSent) {
      setState(() {
        _userMessage.getMessageList.add(m);
        _currentMessage = "";
      });
      _textController.clear();
      FocusScope.of(context).unfocus();
      _scrollToBottom();
    }
  }
}
