

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_petition.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final getPetition = Getpetition();

List<Message> messageList = [
  Message(text: 'Hola amor', fromWho: FromWho.me),
  Message(text: 'Como te fue en el trabajo', fromWho: FromWho.me)
];

Future<void> sendMessage(String text)async{
  if(text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if(text.endsWith('?')){
       herReply();
    }

    notifyListeners();
    moveSrollToBottom();
}


Future<void> herReply()async{
final herMessage = await getPetition.getAnswer();
messageList.add(herMessage);
notifyListeners();
moveSrollToBottom();

}

Future<void> moveSrollToBottom ()async{
  await Future.delayed(const Duration(milliseconds: 100));
  chatScrollController.animateTo(
    chatScrollController.position.maxScrollExtent + 50, 
    duration: const Duration(milliseconds: 300),
     curve: Curves.easeOut
     );
}


}