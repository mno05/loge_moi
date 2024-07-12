import 'dart:convert';

import 'package:get/get.dart';
import 'package:loge_moi/models/property.dart';
import 'package:loge_moi/models/requestProperties.dart';
import 'package:loge_moi/tools/api.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  var isGetingUsers = false.obs;
  var listOfProperties = <Property>[].obs;

  getUsers() async {
    isGetingUsers.value = true;
    // print("Le bien dans le register : ");
    try {
      Api.getProperties().then((response) {
        ResquestProperties resquestProperties =
            ResquestProperties.fromJson(jsonDecode(response.body));
        isGetingUsers.value = false;
        listOfProperties.value = resquestProperties.data!;
        // print("Properties : ${resquestProperties.data!.first.title}");
      });
    } catch (e) {
      isGetingUsers.value = false;

      print("Error in HomeScreenController : " + e.toString());
    }
  }
}
