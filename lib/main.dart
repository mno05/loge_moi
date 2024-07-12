import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loge_moi/screens/auth/login_screen.dart';
import 'package:loge_moi/screens/auth/welcome.dart';
import 'package:loge_moi/screens/home/home.dart';
import 'package:loge_moi/tools/constants.dart/api.dart';
import 'package:nb_utils/nb_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF296f5b)),
        useMaterial3: true,
      ),
      home: const GetWay(),
    );
  }
}

class GetWay extends StatelessWidget {
  const GetWay({super.key});

  @override
  Widget build(BuildContext context) {
    if (getBoolAsync(authYetKey)) {
      //  return Get.to(()=>HomeScreen(),arguments: )
      return const HomeScreen();
    } else {
      return const WelcomScreen();
    }
    return const Placeholder();
  }
}
