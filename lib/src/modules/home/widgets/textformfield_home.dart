import 'package:flutter/material.dart';

class TextFormFieldHome extends StatelessWidget {
  const TextFormFieldHome({Key? key, this.onChanged}) : super(key: key);

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.blue),
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Digite um nome...',
          isDense: true,
          focusedBorder: border,
          enabledBorder: border,
          disabledBorder: border,
          border: border,
        ),
      ),
    );
  }
}
