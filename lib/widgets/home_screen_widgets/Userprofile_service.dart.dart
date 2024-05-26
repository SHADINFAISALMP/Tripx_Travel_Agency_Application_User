import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripx_user_application/firebase_collection_refernce/user_information.dart';

class UserProfileService {
  static Future<DocumentSnapshot> getUserProfileData(String email) async {
    final userProfileSnapshot =
        await userDetails.where('email', isEqualTo: email).get();
    return userProfileSnapshot.docs.first;
  }
}