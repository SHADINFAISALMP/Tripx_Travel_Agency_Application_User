import 'package:tripx_user_application/data_provider/add_image_to_firebase.dart';
import 'package:tripx_user_application/data_provider/user_data.dart';
import 'package:tripx_user_application/firebase_collection_refernce/user_information.dart';

class AddUserDetailsToFirebase {
  addDataToFirebase(context) async {
    try {
      final profileImageUrl =
          await Addimagetofirebase().addprofileimagetofirebase(context);
      final data = Userdetailsdata().userData(profileImageUrl!);
    await  userDetails.add(data);
    } catch (e) {
      print("error $e");
    }
  }
}
