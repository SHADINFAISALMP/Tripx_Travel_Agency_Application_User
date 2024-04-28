import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tripx_user_application/widgets/textformfieldcontroller/controller.dart';

class FirebaseAuthServices {
final  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPassword() async{
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
      return credential.user;
    } catch (e) {
      stdout.write("some error occured");
    }
    return null;
  }


   Future<User?> signInWithEmailandPassword(String email, String password) async{
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
      return credential.user;
    } catch (e) {
      stdout.write("some error occured");
    }
    return null;
  }
}
