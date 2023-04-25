
import 'package:flutter/material.dart';

class Messagefieldbox extends StatelessWidget {
  const Messagefieldbox({super.key});

  @override
  Widget build(BuildContext context) {

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30)
    );
    final textController = TextEditingController();
    final focusnode = FocusNode();
    return TextFormField(
      onTapOutside: (event) {
        focusnode.unfocus();
      },
      focusNode: focusnode,
      controller: textController,
      decoration: InputDecoration(
        hintText: 'End your message with a "??"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print(textValue);
            textController.clear();
          },
           ),        
      ),
      onFieldSubmitted: (value) {
        print('imprimir:$value');
        textController.clear();
        focusnode.requestFocus();
      },
    );
  }
}