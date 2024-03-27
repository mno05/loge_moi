import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustumButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.only(left: 150, right: 150, top: 20, bottom: 20),
          ),
          elevation: const MaterialStatePropertyAll(0.0),
          backgroundColor: const MaterialStatePropertyAll(
            Color(0xFF296f5b),
          ),
          // backgroundColor: MaterialStatePropertyAll(defaultColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ))),
      child: Text(
        text,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
