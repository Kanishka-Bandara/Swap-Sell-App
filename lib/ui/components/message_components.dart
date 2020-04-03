import 'package:flutter/material.dart';
import 'package:swap_sell/model/message/message.dart';
import 'package:swap_sell/model/message/message_metadata.dart';

class MessageComponents {
  static Widget _buildMessageTile(BuildContext context, Message message) {
    return Column(
      children: <Widget>[
        Container(
          // height: 50,
          padding: EdgeInsets.all(10),
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: message.getCategory == MessageMetadata.SENT_MESSAGE
                ? BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                blurRadius: 6,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Text(message.getMessage),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.bottomRight,
          width: 200,
          child: Text(
              "${message.getSentAt.year}-${message.getSentAt.month}-${message.getSentAt.day} ${message.getSentAt.hour}:${message.getSentAt.minute}"),
        ),
      ],
    );
  }

  static Widget buildMessageRowTile(BuildContext context, Message message) {
    return Container(
      padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
      alignment: message.getCategory == MessageMetadata.SENT_MESSAGE
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: _buildMessageTile(context, message),
    );
  }
}
