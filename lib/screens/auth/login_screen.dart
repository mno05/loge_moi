import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loge_moi/constants.dart';
import 'package:loge_moi/screens/auth/registre_screen.dart';
import 'package:loge_moi/screens/home/home.dart';
import 'package:loge_moi/screens/widgets/custmButton.dart';
import 'package:loge_moi/screens/widgets/custmTextField.dart';
import 'package:loge_moi/screens/widgets/custumDivider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Container(
        height: screenSize(context).height,
        width: screenSize(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Connexion",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam in nostrum reprehenderit repellendus consequatur amet nam eligendi consequuntur enim corporis.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const CustumTfd(
              text: "Email",
              icon: FontAwesomeIcons.envelope,
              isEMail: true,
            ),
            const CustumTfd(
              text: "Mot de passe",
              icon: FontAwesomeIcons.lock,
              isPassword: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text("Mot de passe oublié"),
                ),
              ],
            ),
            CustumButton(
              text: "Connexion",
              onPressed: () {
                Get.to(() => const HomeScreen());
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  custumDiver(context),
                  const Text("Avec"),
                  custumDiver(context),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.google,
                  ),
                  SizedBox(width: 70),
                  Icon(
                    FontAwesomeIcons.facebook,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Nouveau?"),
          TextButton(
              onPressed: () {
                Get.to(() => const RegistreScreen());
              },
              child: const Text("Créer un compte"))
        ],
      ),
    );
  }
}
