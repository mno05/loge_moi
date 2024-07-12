import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loge_moi/constants.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white24,
        height: 50,
        width: 50,
        child: LoadingAnimationWidget.fourRotatingDots(
          color: primary,
          size: 50,
        ));
  }
}
