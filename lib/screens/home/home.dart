import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loge_moi/constants.dart';
import 'package:loge_moi/controllers/auth/home_screen_controller.dart';
import 'package:loge_moi/models/property.dart';
import 'package:loge_moi/models/userModel.dart';
import 'package:loge_moi/screens/home/postDetails.dart';
import 'package:loge_moi/screens/widgets/circleAvatar.dart';
import 'package:loge_moi/screens/widgets/custmTextField.dart';
import 'package:loge_moi/screens/widgets/drawer.dart';
import 'package:loge_moi/screens/widgets/postContenaire.dart';
import 'package:loge_moi/tools/constants.dart/api.dart';
import 'package:nb_utils/nb_utils.dart';
// import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController _controller = Get.put(HomeScreenController());
  UserModel? user = Get.arguments;

  @override
  void initState() {
    user ??= UserModel.fromJson(getJSONAsync(userKey));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        user: user!,
      ),
      appBar: AppBar(
        title: Row(
          children: [
            CustCircleAvatar(
              raduis: 40,
              pathImg: user!.image,
            ),
            const SizedBox(width: 20),
            Text(
              user!.name,
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
        // height: screenSize(context).height,
        // width: screenSize(context).width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _searchWithFilter(context),
                _hotelWithToutvoir(context),
                Obx(
                  () => _controller.isGetingUsers.value
                      ? Loader()
                      : _listOfProperties(
                          context, _controller.listOfProperties),
                )
                // PostContainer(
                //   onTap: () {
                //     Get.to(() => PostDetails());
                //   },
                //   images: [
                //     "https://cdn.pixabay.com/photo/2017/09/09/18/25/living-room-2732939_1280.jpg",
                //     "https://cdn.pixabay.com/photo/2017/03/19/01/43/living-room-2155376_1280.jpg",
                //     "https://cdn.pixabay.com/photo/2016/11/30/08/48/bedroom-1872196_1280.jpg",
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _listOfProperties(context, List properties) {
    return SizedBox(
      height: screenSize(context).height,
      width: screenSize(context).width,
      child: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return PostContainer(
            property: properties[index],
            images: [
              "https://img.freepik.com/vecteurs-libre/design-plat-dessine-main-sans-signe-photo_23-2149258788.jpg?t=st=1714432369~exp=1714435969~hmac=533a88c33dcf2a9700f304c455f999e1df1c9d840c503001e05d19ae914c596f&w=740"
            ],
          );
        },
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
