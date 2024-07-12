import 'package:flutter/material.dart';
import 'package:loge_moi/constants.dart';

class CustCircleAvatar extends StatelessWidget {
  final double raduis;
  final String? pathImg;
  const CustCircleAvatar(
      {super.key, required this.raduis, required this.pathImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: raduis,
      width: raduis,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        image: (pathImg != null)
            ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  pathImg!,
                ),
              )
            : const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  profile_default,
                ),
              ),
        // image: Image.network(),
      ),
    );
  }
}
