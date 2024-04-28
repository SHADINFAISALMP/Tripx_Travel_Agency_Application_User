import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';

firebase_storage.Reference userStorageReference(context) {
  firebase_storage.Reference userStorage = firebase_storage
      .FirebaseStorage.instance
      .ref('Userimages')
      .child(BlocProvider.of<ProfileimageBloc>(context).state.imagepath);
  return userStorage;
}