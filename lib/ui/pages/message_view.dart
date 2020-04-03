import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/message_controlller.dart';
import 'package:swap_sell/model/message/message.dart';
import 'package:swap_sell/model/message/message_category.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/message_components.dart';
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
            TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Messages",
                  icon: Icon(Icons.chat),
                ),
                Tab(
                  text: "Archived",
                  icon: Icon(Icons.archive),
                ),
              ],
            ),
          ),
          drawer: MyMenu.getMyMenu(context),
          body: ScopedModelDescendant(
            builder:
                (BuildContext context, Widget widget, MessageController model) {
              return TabBarView(children: <Widget>[
                model.isEmptyMessageList
                    ? DefaultComponents.buildNoDetailsWidget(
                        context, Icons.message, "No Messages To View.")
                    : _buildMessageSection(),
                model.isEmptyArchivedMessageList
                    ? DefaultComponents.buildNoDetailsWidget(
                        context, Icons.message, "No Messages To View.")
                    : _buildArchivedMessageSection(),
              ]);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMessageSection() {
    return Column(
      children: <Widget>[
        MessageComponents.buildMessageRowTile(
          context,
          Message(
            id: 1,
            category: MessageMetadata.SENT_MESSAGE,
            message: "Are you comming today.",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            status: MessageMetadata.LIVE_MESSAGE,
          ),
        ),
        MessageComponents.buildMessageRowTile(
          context,
          Message(
            id: 1,
            category: MessageMetadata.RECEIVED_MESSAGE,
            message: "Yes I am.",
            viewedAt: DateTime(2019, 10, 20, 15, 23, 25),
            sentAt: DateTime(2019, 10, 20, 10, 23, 25),
            status: MessageMetadata.LIVE_MESSAGE,
          ),
        ),
      ],
    );
  }

  Widget _buildArchivedMessageSection() {
    return Column(
      children: <Widget>[
        Text("In the messages"),
      ],
    );
  }
}
