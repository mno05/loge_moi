import 'dart:convert';

import 'package:get/get.dart';
// import 'package:loge_moi/models/requestApiModel.dart';
import 'package:loge_moi/models/userModel.dart';
import 'package:loge_moi/screens/home/home.dart';
import 'package:loge_moi/tools/api.dart';
import 'package:loge_moi/tools/constants.dart/api.dart';
import 'package:nb_utils/nb_utils.dart';

class AuthController extends GetxController {
  var isRegistering = false.obs;

  register(UserModel user) async {
    isRegistering.value = true;
    // print("Le bien dans le register : ");
    try {
      await Api.createUser(user).then((response) async {
        // RequestApiModel request = RequestApiModel.fromJson(value);
        isRegistering.value = false;

        UserModel user = UserModel.fromJson(jsonDecode(response.body));
        if (response.statusCode == 201) {
          await setValue(userKey, jsonDecode(response.body));
          await setValue(authYetKey, true);
          Get.offAll(() => const HomeScreen(), arguments: user);
        } else {
          toast(response.body);
        }
      });
    } catch (e) {
      print("Error in AuthController : " + e.toString());
    }
  }
}
