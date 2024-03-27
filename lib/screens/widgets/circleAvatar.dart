import 'package:flutter/material.dart';

class CustCircleAvatar extends StatelessWidget {
  final double raduis;
  final String pathImg;
  const CustCircleAvatar(
      {super.key, required this.raduis, required this.pathImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: raduis,
      width: raduis,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            pathImg,
          ),
        ),
        // image: Image.network(),
      ),
    );
  }
}
