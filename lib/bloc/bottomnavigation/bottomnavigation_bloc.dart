import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';


part 'bottomnavigation_event.dart';
part 'bottomnavigation_state.dart';

class BottomnavigationBloc extends Bloc<BottomnavigationEvent, BottomnavigationState> {
  BottomnavigationBloc() : super(BottomnavigationInitial()) {
    on<BottomnavigationEvent>((event, emit) {
    
    });
  }
}
