import 'package:flutter/material.dart';
import 'package:si_no_app/config/helpers/get_answer.dart';
import 'package:si_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messageList = [
    Message(text: 'Hola cariño', fromWho: FromWho.mio),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.mio),
  ];

  final scrollController = ScrollController();

  void sendMessage (String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.mio);
    
    if (text.isEmpty) return;
    
    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBottom();
    if (text.endsWith('?')) {
      herReply();
    }
  }

  Future<void> herReply() async {
    
    final herMessage = await GetYesNoAnswer().getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }



  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut
    );
  }
}