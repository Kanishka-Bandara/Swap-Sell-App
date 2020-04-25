import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/controllers/message_controlller.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/my_menu.dart';
import 'package:swap_sell/ui/components/shimmer_tile.dart';

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
      model: AppInit.currentApp,
      child: ScopedModelDescendant<AppInit>(
        builder: (BuildContext context, Widget widget, AppInit model1) {
          return ScopedModel(
            model: MessageController.defaultMessageController,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: ApplicationBar.createNormalAppBar(
                  context,
                  "Messages",
                  true,
                  true,
                  TabBar(
                    tabs: <Widget>[
                      Tab(
                        text: "Messages",
                        // icon: Icon(Icons.chat),
                      ),
                      Tab(
                        text: "Archived",
                        // icon: Icon(Icons.archive),
                      ),
                    ],
                  ),
                ),
                drawer: MyMenu.getMyMenu(context),
                body: ScopedModelDescendant(
                  builder: (BuildContext context, Widget widget,
                      MessageController model) {
                    return TabBarView(
                      children: <Widget>[
                        model1.currentUserState
                            ? model.isEmptyMessageList
                                ? DefaultComponents.buildNoDetailsWidget(
                                    context,
                                    Icons.message,
                                    "No Messages To View.")
                                : _buildMessageSection()
                            : DefaultComponents.buildUnSignedTile(
                                context, "Please Sign in to get messages."),
                        model1.currentUserState
                            ? model.isEmptyArchivedMessageList
                                ? DefaultComponents.buildNoDetailsWidget(
                                    context,
                                    Icons.message,
                                    "No Archived Messages.")
                                : _buildArchivedMessageSection()
                            : DefaultComponents.buildUnSignedTile(
                                context, "Please Sign in to get messages."),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessageSection() {
    return Container(
      // child: SingleChildScrollView(
      child: FutureBuilder(
        future: MessageController.defaultMessageController.getMessageList,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: ShimmerTile(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height, context),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        AppNavigator.navigateToChatViewPage(
                          context,
                          snapshot.data[index],
                        );
                        snapshot.data[index].setAllAsRead();
                      },
                      leading: snapshot.data[index].sentBy.profilePicUrl == null
                          ? Icon(Icons.perm_identity)
                          : Image.network(
                              snapshot.data[index].sentBy.profilePicUrl),
                      title: Text(
                          "${snapshot.data[index].sentBy.fName} ${snapshot.data[index].sentBy.lName}"),
                      subtitle: Text(snapshot.data[index].messageList[0].message
                                  .toString()
                                  .length >
                              30
                          ? "${snapshot.data[index].messageList[0].message.toString().substring(0, 30)} ..."
                          : snapshot.data[index].messageList[0].message),
                      trailing: snapshot.data[index].getUnreadMessageCount > 0
                          ? DefaultComponents.buildRoundedNotificationLabel(
                              context,
                              "${snapshot.data[index].getUnreadMessageCount}",
                              Theme.of(context).primaryColor,
                              30,
                              30,
                              50,
                            )
                          : Text(""),
                    ),
                    Divider(
                      height: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                );
              },
              itemCount: snapshot.data.length,
            );
          }
        },
      ),
      // ),
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
