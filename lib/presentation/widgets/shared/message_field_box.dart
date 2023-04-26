
import 'package:flutter/material.dart';

class Messagefieldbox extends StatelessWidget {

  final ValueChanged<String> onValue;
  const Messagefieldbox({
    super.key, 
    required this.onValue
    });

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
            textController.clear();
            onValue(textValue);
          },
           ),        
      ),
      onFieldSubmitted: (value) {
        textController.clear();
        focusnode.requestFocus();
        onValue(value);
      },
    );
  }
}