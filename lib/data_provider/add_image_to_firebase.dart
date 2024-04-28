
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';


class Addimagetofirebase {
  Future<String?> addprofileimagetofirebase(context) async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('Userimages')
          .child(BlocProvider.of<ProfileimageBloc>(context, listen: false)
              .state
              .imagepath);
      final meta = firebase_storage.SettableMetadata(contentType: "image/jpeg");
      await ref.putData(
          BlocProvider.of<ProfileimageBloc>(context, listen: false)
              .state
              .imageInBytes!,
          meta);
      String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print("$e");
      return null;
    }

    // try {
    //   await FirebaseFirestore.instance.collection('userdetails').add({
    //     'name': namecontroller.text.trim(),
    //     'email': emailcontroller.text.trim(),
    //     'phonenumber': phonecontroller.text.trim(),
    //     'password': passwordcontroller.text.trim(),
    //     'confirmpassword': confirmpasswordcontroler.text.trim(),
    //     'image': url
    //   });
    //   return url;

    // } catch (e) {
    //  print("Error uploading image: $e");
    // return null;
    // }
  }
}
