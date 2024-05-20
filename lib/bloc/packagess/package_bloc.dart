import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

part 'package_event.dart';
part 'package_state.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  
  PackageBloc() : super(PackageInitial()) {
    
  }


}
