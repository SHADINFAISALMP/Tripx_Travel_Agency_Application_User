part of 'bottomnavigation_bloc.dart';

@immutable
sealed class BottomnavigationState {
  final int currentpageindex;

  const BottomnavigationState({required this.currentpageindex});
}

final class BottomnavigationInitial extends BottomnavigationState {
  const BottomnavigationInitial({required super.currentpageindex});
}
