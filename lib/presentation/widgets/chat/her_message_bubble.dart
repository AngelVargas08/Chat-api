import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerMessageBuble extends StatelessWidget {

  final Message message;
  const HerMessageBuble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
         _ImageBubble(message: message,),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
   final Message message;
  const _ImageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        message.imageUrl!,
        width: size.width * 0.7,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child;

          return SizedBox(
            width: size.width*0.7,
            height: 200,
            child: const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child:  Text('Queen esta enviando una imagen...'),
            ),
          );
        },
      ),
    );
  }
}
