part of 'bottomnavigation_bloc.dart';

@immutable
sealed class BottomnavigationState {}

final class BottomnavigationInitial extends BottomnavigationState {}

class TabChangedState extends BottomnavigationState {
  final int selectedindex;

  TabChangedState({required this.selectedindex});
}
