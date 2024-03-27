import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loge_moi/constants.dart';
import 'package:loge_moi/screens/auth/login_screen.dart';
import 'package:loge_moi/screens/auth/registre_screen.dart';
import 'package:loge_moi/screens/widgets/custmButton.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var raduisValue = screenSize(context).width / 4;
    return Scaffold(
      body: Container(
        height: screenSize(context).height,
        width: screenSize(context).width,
        child: Stack(
          children: [
            Container(
              height: screenSize(context).height,
              width: screenSize(context).width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    img_welcome_bg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: screenSize(context).height / 2.1,
                width: screenSize(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(raduisValue),
                    topRight: Radius.circular(raduisValue),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Bienvenue à LogeMoi",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam in nostrum reprehenderit repellendus consequatur amet nam eligendi consequuntur enim corporis.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    CustumButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      text: "Connexion",
                    ),
                    TextButton(
                        onPressed: () => Get.to(() => const RegistreScreen()),
                        child: Text(
                          "Créer un compte",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
