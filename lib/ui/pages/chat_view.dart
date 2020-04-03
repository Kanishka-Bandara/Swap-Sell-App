import 'package:flutter/material.dart';
import 'package:swap_sell/model/message/user_message.dart';
import 'package:swap_sell/ui/components/app_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "Chat",
        true,
        null,
        // Row(
        //   children: <Widget>[],
        // ),
      ),
    );
  }
}
