import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loge_moi/constants.dart';
import 'package:loge_moi/screens/widgets/circleAvatar.dart';
import 'package:loge_moi/screens/widgets/custmTextField.dart';
import 'package:loge_moi/screens/widgets/postContenaire.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CustCircleAvatar(
              raduis: 55,
              pathImg:
                  "https://img.freepik.com/free-photo/portrait-smiley-man-having-good-time_23-2148666496.jpg",
            ),
            const SizedBox(width: 20),
            Text(
              "Moïse NDJADI",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell)),
        ],
      ),
      body: Container(
        height: screenSize(context).height,
        width: screenSize(context).width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _searchWithFilter(context),
                _hotelWithToutvoir(context),
                PostContainer(
                  images: [
                    "https://cdn.pixabay.com/photo/2017/09/09/18/25/living-room-2732939_1280.jpg",
                    "https://cdn.pixabay.com/photo/2017/03/19/01/43/living-room-2155376_1280.jpg",
                    "https://cdn.pixabay.com/photo/2016/11/30/08/48/bedroom-1872196_1280.jpg",
                  ],
                ),
                PostContainer(
                  images: [
                    "https://cdn.pixabay.com/photo/2016/11/30/08/48/bedroom-1872196_1280.jpg",
                  ],
                ),
                PostContainer(
                  images: [
                    "https://cdn.pixabay.com/photo/2017/03/19/01/43/living-room-2155376_1280.jpg",
                  ],
                ),
                // PostContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _hotelWithToutvoir(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hôtel",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Tout voir",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}

_searchWithFilter(context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustumTfd(
          text: "Recherche",
          icon: FontAwesomeIcons.search,
          width: screenSize(context).width * .80,
        ),
        Container(
          width: 50,
          height: screenSize(context).height * .08,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.tune,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
