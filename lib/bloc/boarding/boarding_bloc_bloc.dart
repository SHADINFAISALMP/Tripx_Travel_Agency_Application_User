import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'boarding_bloc_event.dart';
part 'boarding_bloc_state.dart';

class BoardingBlocBloc extends Bloc<BoardingBlocEvent, BoardingBlocState> {
  BoardingBlocBloc() : super(BoardingBlocInitial(activepage: 0)) {
    on<Boardingbuttonclick>(boardingbuttonclick);
    on<Boardinggetstartedclick>(boardinggetstartedclick);
  }

  FutureOr<void> boardingbuttonclick(
      Boardingbuttonclick event, Emitter<BoardingBlocState> emit) {
    print('added next');
    emit(changeboarding(activepage: event.index));
  }

  FutureOr<void> boardinggetstartedclick(
      Boardinggetstartedclick event, Emitter<BoardingBlocState> emit) {
    print('get stared');
    emit(Boardingnavigate(activepage: state.activepage));
  }
}
