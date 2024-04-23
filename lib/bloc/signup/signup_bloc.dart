import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupInitial(imagepath: '')) {
    on<Imagebuttonpress>(_imagebuttonpress);
    on<Confirmpassword>(_confirmPassword);
  }

  void _imagebuttonpress(
      Imagebuttonpress event, Emitter<SignupState> emit) async {
    final picker = ImagePicker();
    final pickedimage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      emit(SignupInitial(imagepath: pickedimage.path));
    } else {
      emit(Imagenotpicked(imagepath: state.imagepath));
    }
  }

  void _confirmPassword(Confirmpassword event, Emitter<SignupState> emit) {
    emit(ConfirmPasswordState(
        isConfirmed: event.isconfirmpassword, imagepath: state.imagepath));
  }
}
