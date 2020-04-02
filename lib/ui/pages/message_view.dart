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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: ApplicationBar.createNormalAppBar(
            context,
            "Messages",
            true,
            TabBar(tabs: <Widget>[
              Tab(
                text: "Messages",
                icon: Icon(Icons.chat),
              ),
              Tab(
                text: "Archived",
                icon: Icon(Icons.archive),
              ),
            ]),
          ),
          drawer: MyMenu.getMyMenu(context),
          body: ScopedModelDescendant(
            builder:
                (BuildContext context, Widget widget, MessageController model) {
              return TabBarView(children: <Widget>[
                DefaultComponents.buildNoDetailsWidget(
                    context, Icons.message, "No Messages To View."),
                DefaultComponents.buildNoDetailsWidget(
                    context, Icons.message, "No Messages To View."),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
