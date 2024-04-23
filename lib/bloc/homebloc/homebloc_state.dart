part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocState {}

final class HomeblocInitial extends HomeblocState {}

class HomeDataLoading extends HomeblocState {
 
}

class DetailScreenNavigating extends HomeblocState {
  
}

class ProfileUpdating extends HomeblocState {
 
}

class DrawerToggled extends HomeblocState {
 
}