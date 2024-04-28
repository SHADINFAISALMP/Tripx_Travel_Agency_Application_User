import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'bottomnavigation_event.dart';
part 'bottomnavigation_state.dart';

class BottomnavigationBloc
    extends Bloc<BottomnavigationEvent, BottomnavigationState> {
  BottomnavigationBloc() : super(const BottomnavigationInitial(currentpageindex: 0)) {
    on<ChangeTabEvent>(ontabchanged);
  }
  ontabchanged(ChangeTabEvent event, Emitter<BottomnavigationState> emit) {
    print("adnan");
    emit(BottomnavigationInitial(currentpageindex: event.pageIndex));
  }
}
