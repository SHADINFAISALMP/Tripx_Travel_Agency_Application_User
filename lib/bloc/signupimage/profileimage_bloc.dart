import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';


part 'profileimage_event.dart';
part 'profileimage_state.dart';

class ProfileimageBloc extends Bloc<ProfileimageEvent, ProfileimageState> {
  ProfileimageBloc() : super(const ProfileimageInitial(imagepath: '', imageInBytes: null)) {
    on<Imagepress>(_imagepress);
  }
   _imagepress(
      Imagepress event, Emitter<ProfileimageState> emit) async {
            String? imagePath;
    Uint8List? selectedImageInBytes;
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = image.name;
      selectedImageInBytes = await image.readAsBytes();

      emit(ProfileimageInitial(
          imagepath: imagePath, imageInBytes: selectedImageInBytes));
    }
  }
}
