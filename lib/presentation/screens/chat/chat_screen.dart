import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

import '../../widgets/chat/her_message_bubble.dart';

class ChatScreen extends StatelessWidget {
   
  const ChatScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:  const Padding(
          padding:  EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://media.licdn.com/dms/image/C4E03AQG6QYWokDf7_g/profile-displayphoto-shrink_200_200/0/1619140662087?e=1686182400&v=beta&t=9ckgq-r0sgFSQlQHkaX7S-vraMVGgPCnDOVAMHCeGxg'),
          ),
        ),
        title: const Text('Queen <3'),
        
      ),
      body:const  _Chatview()
    );
  }
}

class _Chatview extends StatelessWidget {
  const _Chatview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder:(context, index) {

                final message = chatProvider.messageList[index];
               return (message.fromWho == FromWho.me)?
               MyMessageBuble(message: message,) 
              :
              const HerMessageBuble() ;  
              }       
              )
              ),
             Messagefieldbox(onValue: (value) => chatProvider.sendMessage(value),)
          ],
        ),
      ),
    );
  }
}