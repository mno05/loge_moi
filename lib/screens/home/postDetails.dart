import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loge_moi/constants.dart';
import 'package:loge_moi/screens/styles.dart';
import 'package:loge_moi/screens/widgets/detailsPost/postDetailsContainer.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenSize(context).height,
        width: screenSize(context).width,
        child: Column(
          children: [
            _detailsImages(context),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _typeAndeNote(context),
                  _desc(context),
                  _info(context),
                  // _location(context),
                  // _buyerSinfon(context),
                  // _priceAndPayeButton(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _typeAndeNote(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Logiment propre",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text("4.5"),
            ],
          ),
        ),
      ],
    );
  }

  _detailsImages(contex) {
    return Hero(
      tag: "Post",
      child: PostDetailsContainer(
        images: [
          "https://cdn.pixabay.com/photo/2017/09/09/18/25/living-room-2732939_1280.jpg",
          "https://cdn.pixabay.com/photo/2017/03/19/01/43/living-room-2155376_1280.jpg",
          "https://cdn.pixabay.com/photo/2016/11/30/08/48/bedroom-1872196_1280.jpg",
        ],
      ),
    );
  }

  _desc(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Kabalo 47bis",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                    color: primary,
                  ),
                  Text(
                    "Kinshasa,Barumbu",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Text(
                "400\$",
                style: titleStyle(color: primary),
              ),
              Text(
                "Par mois",
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _info(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Informations",
                style: titleStyle(),
              ),
            ],
          ),
          Text(
            "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Perspiciatis quis impedit suscipit id, nesciunt ipsam atque voluptas sapiente assumenda beatae exercitationem dicta iste eligendi dolor adipisci vero laborum commodi eius ratione? Itaque quidem perspiciatis inventore deserunt amet. Rem, odit repellendus?",
            style: grayStyle(),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
