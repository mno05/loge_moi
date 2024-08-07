import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loge_moi/constants.dart';
import 'package:loge_moi/models/property.dart';
// import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class PostContainer extends StatelessWidget {
  final Property property;
  final List<String> images;
  final onTap;
  PostContainer({
    super.key,
    required this.images,
    this.onTap,
    required this.property,
  });
  Observable _controller = Get.put(Observable());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          // height: screenSize(context).height / 1.8,
          width: screenSize(context).width,
          child: Column(
            children: [
              Container(
                height: screenSize(context).height / 2.5,
                width: screenSize(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                child: Stack(
                  children: [
                    FlutterCarousel.builder(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        disableCenter: true,
                        // enlargeCenterPage: true,
                      ),
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        height: screenSize(context).height / 2.5,
                        width: screenSize(context).width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(images[itemIndex]),
                            fit: BoxFit.cover,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black54,
                              Colors.black12,
                            ],
                          ),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Row(
                  children: [
                    Text(
                      property.title!,
                      // "Lemba, Kabalo 47bis",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenSize(context).width / 1.3,
                      child: Text(
                        property.description!,
                        // "Maison avec deux chambre salon, très espacieux avec une belle vue sur la blage",
                        style: GoogleFonts.poppins(
                          color: Colors.black45,
                          fontSize: 18,
                        ),
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      " ${property.price}\$",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      " par mois",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Observable extends GetxController {
  final isFavorite = false.obs;

  changeFavoriteValue() {
    isFavorite.value = !isFavorite.value;
  }
}
