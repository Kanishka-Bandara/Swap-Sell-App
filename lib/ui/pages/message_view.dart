import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/message_controlller.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/my_menu.dart';

class MessageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageViewState();
  }
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: MessageController.defaultMessageController,
        child: Scaffold(
          appBar: ApplicationBar.createNormalAppBar(context, "Messages", true),
          drawer: MyMenu.getMyMenu(context),
          body: DefaultComponents.buildNoDetailsWidget(
              context, Icons.message, "No Messages To View."),
        ));
  }
}
