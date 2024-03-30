import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:loge_moi/constants.dart';
import 'package:loge_moi/screens/widgets/postContenaire.dart';

class PostDetailsContainer extends StatelessWidget {
  final List<String> images;
  PostDetailsContainer({super.key, required this.images});
  Observable _controller = Get.find<Observable>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize(context).width,
      child: Stack(
        children: [
          FlutterCarousel.builder(
            options: CarouselOptions(
              viewportFraction: 1,
              disableCenter: true,
              // enlargeCenterPage: true,
              indicatorMargin: 86,
              floatingIndicator: true,
            ),
            itemCount: images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              height: screenSize(context).height / 2.5,
              // width: screenSize(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images[itemIndex]),
                  fit: BoxFit.cover,
                ),
                gradient: const LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.black12,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 200,
              width: screenSize(context).width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 30,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_circle_left_rounded,
                size: 45,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 30,
            child: SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                icon: Obx(
                  () => _controller.isFavorite.value
                      ? const Icon(
                          Icons.favorite,
                          size: 35,
                          color: Colors.red,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              offset: Offset(1, 3),
                              blurRadius: 10,
                            )
                          ],
                        )
                      : const Icon(
                          Icons.favorite_border_outlined,
                          size: 35,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              offset: Offset(1, 3),
                              blurRadius: 10,
                            )
                          ],
                        ),
                ),
                onPressed: _controller.changeFavoriteValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
