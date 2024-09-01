import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  NumberButton({super.key, required this.text, required this.onClick});

  String text;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () {
            onClick(text);
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
