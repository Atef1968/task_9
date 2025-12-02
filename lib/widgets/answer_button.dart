import 'package:flutter/material.dart';



class AnswerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          isSelected ? Colors.yellow : Colors.white,
        ),
        foregroundColor: WidgetStateProperty.all(Colors.black),
        minimumSize: WidgetStateProperty.all(Size(200, 50)),
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }
}






class ActiveButton extends StatelessWidget {
  final String text ;
  void onPressed() {

  }
   const ActiveButton({
    super.key, required this.text, 
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        minimumSize: WidgetStateProperty.all<Size>(Size(300, 50)),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      onPressed: onPressed, child: Text(text));
  }
}