import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';


part 'boarding_bloc_event.dart';
part 'boarding_bloc_state.dart';

class BoardingBlocBloc extends Bloc<BoardingBlocEvent, BoardingBlocState> {
  BoardingBlocBloc() : super(const BoardingBlocInitial(activepage: 0)) {
    on<Boardingbuttonclick>(boardingbuttonclick);
    on<Boardinggetstartedclick>(boardinggetstartedclick);
  }

  FutureOr<void> boardingbuttonclick(
      Boardingbuttonclick event, Emitter<BoardingBlocState> emit) {
    emit(Changeboarding(activepage: event.index));
  }

  FutureOr<void> boardinggetstartedclick(
      Boardinggetstartedclick event, Emitter<BoardingBlocState> emit) {
    emit(Boardingnavigate(activepage: state.activepage));
  }
}
