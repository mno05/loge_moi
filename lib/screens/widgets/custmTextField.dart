import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustumTfd extends StatelessWidget {
  final bool isEMail;
  final bool isPassword;
  final String text;
  final IconData icon;
  final double? height;
  final double? width;
  const CustumTfd({
    super.key,
    this.isEMail = false,
    this.isPassword = false,
    required this.text,
    required this.icon,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: height ?? 70,
      width: width ?? 400,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(50.0),
        // border: Border(
        //   bottom: BorderSide(color: Colors.grey, width: .3),
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          decoration: InputDecoration(
              icon: Icon(icon),
              hintText: text,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {
                        //solidEyeSlash
                      },
                      icon: Icon(FontAwesomeIcons.solidEye),
                    )
                  : null),
          obscureText: isPassword,
          keyboardType:
              isEMail ? TextInputType.emailAddress : TextInputType.text,
        ),
      ),
    );
  }
}
