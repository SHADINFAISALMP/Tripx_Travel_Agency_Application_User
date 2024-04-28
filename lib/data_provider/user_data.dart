import 'package:tripx_user_application/models/user_models.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

class Userdetailsdata {
  Map<String, dynamic> userData(String downloadURL) {
    final data = UserModel(
            name: namecontroller.text.trim(),
            email: emailcontroller.text.trim(),
            phonenumber: phonecontroller.text.trim(),
            password: passwordcontroller.text.trim(),
            confirmpassword: confirmpasswordcontroler.text.trim(),
            imagepath: downloadURL)
        .toMap();
    return data;
  }
}
