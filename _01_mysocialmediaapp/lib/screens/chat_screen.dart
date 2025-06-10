import 'package:flutter/material.dart';
import 'package:_01_mysocialmediaapp/data/data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {"text": "hey there! How Are You", "isMe": false, "time": "10:30 AM"},
    {"text": "Iam Good,Thanks! How Bout You", "isMe": true, "time": "10:32 AM"},
    {
      "text": "Just working on FLutter Project need some help!",
      "isMe": false,
      "time": "10:33 AM",
    },
  ];
  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        "text": _messageController.text,
        "isMe": true,
        "time": "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
      });
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(users[1].profileImageUrl)),
            SizedBox(width: 16),
            Text(users[1].name),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
        ],
      ),
      body: Column(
        children: [
          //_message kita masukan di list builder tampilanya
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment:
                      message["isMe"]
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color:
                          message['isMe']
                              ? Theme.of(context).primaryColor
                              : Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message["text"],
                          style: TextStyle(
                            color:
                                message["isMe"] ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          message['time'],
                          style: TextStyle(
                            fontSize: 10,
                            color:
                                message['isMe']
                                    ? Colors.white70
                                    : Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
