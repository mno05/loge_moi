import 'package:http/http.dart' as http;
import 'package:loge_moi/models/userModel.dart';
import 'package:loge_moi/tools/constants.dart/api.dart';

class Api {
  static Future createUser(UserModel user) async {
    try {
      var url = Uri.parse("$baseUrl/users");
      var response = await http.post(url, body: user.toJson());

      return response;
    } catch (e) {
      print("This is an error in api CreateUser  : ${e.toString()}");
    }

// print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }

  static Future getProperties() async {
    try {
      var url = Uri.parse(baseUrl + "/properties");
      var response = await http.get(url);

      return response;
    } catch (e) {
      print("This is an error in api CreateUser  :  + ${e.toString()}");
    }
  }
}
