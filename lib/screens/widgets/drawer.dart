import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loge_moi/constants.dart';
import 'package:loge_moi/models/userModel.dart';
import 'package:loge_moi/screens/widgets/circleAvatar.dart';

class AppDrawer extends StatelessWidget {
  final UserModel user;
  const AppDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CustCircleAvatar(
                    raduis: screenSize(context).width * .2,
                    pathImg: user.image),
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Acceuil",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_pin_rounded),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.work_outlined),
            title: Text(
              "Acheter maison",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            // onTap: () => Get.to(() => const ActiviteScreen()),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              "Louer une maison",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.newspaper_rounded),
          //   title: Text(
          //     "Actualités",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Icon(Icons.pages_outlined),
          //   title: Text(
          //     "Publication",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Icon(Icons.markunread_mailbox_rounded),
          //   title: Text(
          //     "Mediatheque",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text(
              "Nous contacter",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              "A propos de nous",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "Deconnexion",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
