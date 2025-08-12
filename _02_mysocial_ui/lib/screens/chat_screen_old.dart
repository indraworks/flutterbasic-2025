import 'package:_02_mysocial_ui/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:_02_mysocial_ui/data/data.dart';
//new
import 'package:_02_mysocial_ui/theme/app_theme.dart'; // THEME
import 'package:_02_mysocial_ui/utils/responsive.dart'; // RESP

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
    final scheme = Theme.of(context).colorScheme; // THEME
    final text = Theme.of(context).textTheme; // THeMe
    final pad = Responsive.pagePadding(context); // Respons
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu),
              ),
        ),

        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(users[1].profileImageUrl)),
            // SizedBox(width: 16),
            SizedBox(width: AppTheme.sp12), //theme
            Text(users[1].name, style: text.titleSmall), //theme
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
              // padding: EdgeInsets.all(10),
              padding: pad, //RESP
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final m = _messages[index];
                final isMe = m['isMe'] as bool;
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    //margin: EdgeInsets.symmetric(vertical: 5.0), //sama yg lama!
                    margin: const EdgeInsets.symmetric(
                      vertical: 6.0,
                    ), // THEME spacing
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      // color:
                      //     message['isMe']
                      //         ? Theme.of(context).primaryColor
                      //         : Colors.grey[300],
                      // borderRadius: BorderRadius.circular(15),
                      color:
                          isMe
                              ? scheme.primary
                              : Theme.of(context).cardColor, // THEME
                      borderRadius: AppTheme.radiusLg, // THEME radius
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          m["text"],
                          // style: TextStyle(
                          //   color:
                          //       isMe ? Colors.white : Colors.black,
                          // ),
                          style:
                              isMe
                                  ? text.bodyLarge?.copyWith(
                                    color: scheme.onPrimary,
                                  ) // THEME
                                  : text.bodyLarge, // THEME
                        ),

                        SizedBox(height: 4),
                        Text(
                          m['time'],
                          // style: TextStyle(
                          //   fontSize: 10,
                          //   color:
                          //       isMe
                          //           ? Colors.white70
                          //           : Colors.grey[100],
                          // ),
                          style:
                              (isMe
                                  ? text.bodySmall?.copyWith(
                                    color: scheme.onPrimary.withValues(
                                      alpha: 0.8,
                                    ),
                                  ) //opacity descrepency
                                  : text.bodySmall?.copyWith(
                                    color: Colors.grey,
                                  )) ??
                              const TextStyle(fontSize: 10), // THEME
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
      drawer: AppDrawer(),
    );
  }
}
