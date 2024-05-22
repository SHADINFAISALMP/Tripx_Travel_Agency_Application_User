import 'dart:math';

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
  String? userEmail;
  PackageBloc(this.firestore, this.auth) : super(PackageInitial()) {
    on<SubmitTravelPackage>(submittravelpackage);
    on<UpdateAdultsCount>(_updateAdultsCount);
    on<UpdateChildrenCount>(_updateChildrenCount);
    on<UpdateRoomsCount>(_updateRoomsCount);
  }

  void _updateAdultsCount(UpdateAdultsCount event, Emitter<PackageState> emit) {
    final currentState = state;
    if (currentState is PackageUpdated) {
      emit(PackageUpdated(
          event.count, currentState.childrenCount, currentState.roomsCount));
    } else {
      emit(PackageUpdated(event.count, 0, 0));
    }
  }

  void _updateChildrenCount(
      UpdateChildrenCount event, Emitter<PackageState> emit) {
    final currentState = state;
    if (currentState is PackageUpdated) {
      emit(PackageUpdated(
          currentState.adultsCount, event.count, currentState.roomsCount));
    } else {
      emit(PackageUpdated(0, event.count, 0));
    }
  }

  void _updateRoomsCount(UpdateRoomsCount event, Emitter<PackageState> emit) {
    final currentState = state;
    if (currentState is PackageUpdated) {
      emit(PackageUpdated(
          currentState.adultsCount, currentState.childrenCount, event.count));
    } else {
      emit(PackageUpdated(0, 0, event.count));
    }
  }

  Future<void> submittravelpackage(
      SubmitTravelPackage event, Emitter<PackageState> emit) async {
    emit(PackageLoading());
    try {
      final user = auth.currentUser;
      if (user != null) {
        userEmail = user.email;
        if (userEmail != null) {
          print("Attempting to find user document...");
          final userQeurySnapshot = await firestore
              .collection("userdetails")
              .where('email', isEqualTo: userEmail)
              .get();

          if (userQeurySnapshot.docs.isNotEmpty) {
            final userDocsnapshot = userQeurySnapshot.docs.first;
            final userId = userDocsnapshot.id;
            print("user document found with id : $userId");
            await firestore
                .collection('userdetails')
                .doc(userId)
                .collection('travelpackagedetails')
                .add(event.travelPackage.toJson());

            print("Travel package added successfully.");
            emit(Packagesucess());
          } else {
            emit(Packageerror("User doc not fouynd"));
            return;
          }
          emit(Packagesucess());
        } else {
          emit(Packageerror("User email not found"));
        }
      } else {
        emit(Packageerror("User not logged in"));
      }
      print("Error: $e");
    } catch (e) {
      emit(Packageerror("error on package submission ${e.toString()}"));
    }
  }
}
