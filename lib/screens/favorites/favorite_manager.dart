import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteManager {
  static Future<bool> isFavorite(String itemId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var doc = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(user.uid)
          .collection('userFavorites')
          .doc(itemId)
          .get();
      return doc.exists;
    }
    return false;
  }

  static Future<void> toggleFavorite(String itemId, Map<String, dynamic> itemData) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorites')
          .doc(user.uid)
          .collection('userFavorites');
      var isFavorite = await FavoriteManager.isFavorite(itemId);
      if (isFavorite) {

        await favoriteCollection.doc(itemId).delete();
        

      } else {
        await favoriteCollection.doc(itemId).set(itemData);
      }
    }
  }
}
