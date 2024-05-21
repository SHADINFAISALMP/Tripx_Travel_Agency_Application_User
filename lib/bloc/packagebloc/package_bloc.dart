import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tripx_user_application/models/traveller_model.dart';

part 'package_event.dart';
part 'package_state.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  PackageBloc(this.firestore, this.auth) : super(PackageInitial()) {
    on<SubmitTravelPackage>(submittravelpackage);
  }
  Future<void> submittravelpackage(
      SubmitTravelPackage event, Emitter<PackageState> emit) async {
    emit(PackageLoading());
    try {
      final user = auth.currentUser;
      if (user != null) {
        await firestore
            .collection('userdetails')
            .doc(user.uid)
            .collection("travelpackagedetails")
            .add(event.travelPackage.toJson());
        emit(Packagesucess());
      } else {
        emit(Packageerror("User not logged in"));
      }
    } catch (e) {
      emit(Packageerror("error on packahe"));
    }
  }
}
