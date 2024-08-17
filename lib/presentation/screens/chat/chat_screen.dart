import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_no_app/config/responsive/responsive_size.dart';
import 'package:si_no_app/domain/entities/message.dart';
import 'package:si_no_app/presentation/providers/chat_provider.dart';
import 'package:si_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:si_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:si_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Olivia_Wilde_in_2010_Independent_Spirit_Awards_%28cropped%29.jpg/220px-Olivia_Wilde_in_2010_Independent_Spirit_Awards_%28cropped%29.jpg'),
          ),
        ),
        title: const Text('Mi amor ♥️', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: false,
      ),
      body: _ChatView()
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messageList.length,
                padding: EdgeInsets.only(bottom: sh(0.05, context)),
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return message.fromWho == FromWho.ella ? HerMessageBubble(message: message) : MyMessageBubble(message: message,);
                },
              ),
            ),
            MessageFieldBox(onValue: chatProvider.sendMessage,)
          ],
        ),
      ),
    );
  }
}