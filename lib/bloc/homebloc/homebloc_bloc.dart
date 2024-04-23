import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';


part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    on<HomeblocEvent>((event, emit) {
      
    });
  }
}
