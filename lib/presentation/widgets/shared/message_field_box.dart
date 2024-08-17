import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {


  const MessageFieldBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    final focusNode = FocusNode();
    final outlineBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );

    void queHago () {
      final textValue = controller.value.text;
      onValue(textValue);
      controller.clear();
      focusNode.requestFocus();
    }

    final laDecoracion = InputDecoration(
      hintText: 'termina el mensaje con ?',
      filled: true,
      enabledBorder: outlineBorder,
      focusedBorder: outlineBorder,
      suffixIcon: IconButton(
        onPressed: () => queHago(),
        icon: const Icon(Icons.send)),
    );

    


    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: laDecoracion,
      onTapOutside: (_) {focusNode.unfocus();},
      onFieldSubmitted: (_) => queHago(),
    );
  }
}