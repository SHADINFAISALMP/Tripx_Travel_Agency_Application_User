part of 'profileimage_bloc.dart';

@immutable
sealed class ProfileimageState {
  final String imagepath;
  final Uint8List? imageInBytes;
  const ProfileimageState(
      {required this.imageInBytes, required this.imagepath});
}

final class ProfileimageInitial extends ProfileimageState {
  const ProfileimageInitial(
      {required super.imageInBytes, required super.imagepath});
}
