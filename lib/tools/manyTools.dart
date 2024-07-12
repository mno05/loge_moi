import 'package:nb_utils/nb_utils.dart';

class ManyTools {
  static bool noEmpyAll(Map<String, String> list) {
    bool isAllOk = true;
    list.forEach((key, value) {
      if (value.isEmpty) {
        toast("Veuillez renseigner le champs $key");
        isAllOk = false;
      }
    });
    return isAllOk;
  }
}
