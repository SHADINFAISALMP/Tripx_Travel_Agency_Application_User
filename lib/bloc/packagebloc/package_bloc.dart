import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tripx_user_application/models/traveller_model.dart';

part 'package_event.dart';
part 'package_state.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  int adultcount = 0;
  int childrencount = 0;
  int roomscount = 1;
  Travelpackage travelPackage = Travelpackage(
    adultcount: 0,
    childrencount: 0,
    roomscount: 1,
    adults: [],
    children: [],
    packagename: '',
    packaageamount: '',
    placename: '',
    adultprice: '',
    childprice: '',
    days: '',
    endate: '',
    hotelprice: '',
    night: '',
    startdate: '',
  );

  PackageBloc() : super(PackageInitial()) {
    on<SubmitTravelPackage>(submittravelpackage);
    on<UpdateAdultsCount>(_updateAdultsCount);
    on<UpdateChildrenCount>(_updateChildrenCount);
    on<UpdateRoomsCount>(_updateRoomsCount);
  }

  void _updateAdultsCount(UpdateAdultsCount event, Emitter<PackageState> emit) {
    adultcount = event.count;
    emit(PackageUpdated(
        adultcount: adultcount,
        childrencount: childrencount,
        roomscount: roomscount,
        travelpackage: travelPackage));
  }

  void _updateChildrenCount(
      UpdateChildrenCount event, Emitter<PackageState> emit) {
    childrencount = event.count;
    emit(PackageUpdated(
        adultcount: adultcount,
        childrencount: childrencount,
        roomscount: roomscount,
        travelpackage: travelPackage));
  }

  void _updateRoomsCount(UpdateRoomsCount event, Emitter<PackageState> emit) {
    roomscount = event.count;
    emit(PackageUpdated(
        adultcount: adultcount,
        childrencount: childrencount,
        roomscount: roomscount,
        travelpackage: travelPackage));
  }

  Future<void> submittravelpackage(
      SubmitTravelPackage event, Emitter<PackageState> emit) async {
    emit(PackageLoading());
    try {
      final user = auth.currentUser;
      if (user != null) {
        final userEmail = user.email;
        if (userEmail != null) {
          final userQuerySnapshot = await firestore
              .collection("userdetails")
              .where('email', isEqualTo: userEmail)
              .get();

          if (userQuerySnapshot.docs.isNotEmpty) {
            final userDocSnapshot = userQuerySnapshot.docs.first;
            final userId = userDocSnapshot.id;

            await firestore
                .collection('userdetails')
                .doc(userId)
                .collection('travelpackagedetails')
                .add(event.travelPackage.toJson());

            emit(Packagesucess());
          } else {
            emit(Packageerror("User document not found"));
            return;
          }
        } else {
          emit(Packageerror("User email not found"));
        }
      } else {
        emit(Packageerror("User not logged in"));
      }
    } catch (e) {
      emit(Packageerror("Error on package submission: ${e.toString()}"));
    }
  }
}
