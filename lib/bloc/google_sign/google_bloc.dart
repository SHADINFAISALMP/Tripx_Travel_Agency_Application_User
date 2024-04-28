import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  GoogleBloc() : super(GoogleInitial()) {
    on<GoogleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
