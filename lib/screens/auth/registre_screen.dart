import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loge_moi/constants.dart';
import 'package:loge_moi/controllers/auth/authController.dart';
import 'package:loge_moi/models/userModel.dart';
import 'package:loge_moi/screens/auth/login_screen.dart';
import 'package:loge_moi/screens/widgets/custmButton.dart';
import 'package:loge_moi/screens/widgets/custmTextField.dart';
import 'package:loge_moi/screens/widgets/custumDivider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class RegistreScreen extends StatelessWidget {
  RegistreScreen({super.key});
  AuthController _controller = Get.put(AuthController());

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var prenom = TextEditingController();
  final nom = TextEditingController();
  final email = TextEditingController();
  final mtp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: SizedBox(
        height: screenSize(context).height,
        width: screenSize(context).width,
        child: Obx(() => (_controller.isRegistering.value)
            ? Loader()
            : _allContent(context)),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Déjà un compte?"),
          TextButton(
              onPressed: () {
                Get.to(() => const LoginScreen());
              },
              child: const Text("Se connecter"))
        ],
      ),
    );
  }

  Widget _allContent(context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "S'inscrire",
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustumTfd(
                    editingController: prenom,
                    text: "Prenom",
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mettez votre prenom';
                      }
                      return null;
                    },
                  ),
                  CustumTfd(
                    editingController: nom,
                    text: "Nom",
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mettez votre nom';
                      }
                      return null;
                    },
                  ),
                  CustumTfd(
                    editingController: email,
                    text: "Email",
                    icon: FontAwesomeIcons.solidEnvelope,
                    isEMail: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mettez votre email';
                      }
                      return null;
                    },
                  ),
                  CustumTfd(
                    editingController: mtp,
                    text: "Mot de passe",
                    icon: FontAwesomeIcons.lock,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mettez votre prenom';
                      } else if (value.length <= 8) {
                        return 'Le mot de passe doit avoir au moins 8 caractères';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {
                    print(value);
                  },
                ),
                const Text("J'accepte les conditions d'utilisations")
              ],
            ),
            CustumButton(
              text: "Inscription",
              onPressed: () {
                UserModel user = UserModel(
                    name: prenom.text + " " + nom.text,
                    email: email.text,
                    password: mtp.text);
                _controller.register(user);

                // if (!_formKey.currentState!.validate()) {

                // UserModel userExemple = UserModel(
                //     name: "Moses NDJADI",
                //     email: "ndjai@gmail.com",
                //     password: "123456");

                // AuthController.register(userExemple);
                // }
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
    );
  }
}
