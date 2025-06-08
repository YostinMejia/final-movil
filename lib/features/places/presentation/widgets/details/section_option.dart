
import 'package:flutter/material.dart';

class SectionOption extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;
  const SectionOption({super.key, required this.isActive, required this.onPressed, required this.text });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor:
            isActive ? Theme.of(context).primaryColor : Colors.grey,
        textStyle: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      child: Text(text),
    );
  }
}