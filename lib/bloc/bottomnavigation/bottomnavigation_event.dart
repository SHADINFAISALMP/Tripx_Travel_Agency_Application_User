part of 'bottomnavigation_bloc.dart';

@immutable
sealed class BottomnavigationEvent {}

class ChangeTabEvent extends BottomnavigationEvent {
  final int pageIndex;

  ChangeTabEvent({required this.pageIndex});
}
