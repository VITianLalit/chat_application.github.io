import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  // text controller
  final TextEditingController _messageController = TextEditingController();

  // chat & auth service
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    // if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatServices.sendMessage(receiverID, _messageController.text);

      //clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          //display all message
          Expanded(child: _buildMessageList()),
          //user input
          _buildUserInput(),
        ],
      ),
    );
  }

  //buid message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatServices.getMessage(receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }

          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          // return list view
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data['message'], isCurrentUser: isCurrentUser)
          ],
        ));
  }

  //build message input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          //textfield should take up most of the space
          Expanded(
              child: MyTextfield(
                  hintText: "Type a message",
                  obscurText: false,
                  controller: _messageController)),
          //send button
          Container(
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.only(right: 25),
              child: IconButton(
                  onPressed: sendMessage,
                  icon: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
