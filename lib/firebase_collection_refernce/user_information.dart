import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference userDetails =
    FirebaseFirestore.instance.collection('userdetails');

    
final CollectionReference packageDetails =
      FirebaseFirestore.instance.collection('packagedetails');