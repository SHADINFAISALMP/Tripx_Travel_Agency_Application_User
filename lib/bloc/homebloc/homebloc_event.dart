part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocEvent {}

class Loadhomedata extends HomeblocEvent{

}

class Navigatetodetail extends HomeblocEvent{

}

class Updateprofile extends HomeblocEvent{

}

class Toggledrawer extends HomeblocEvent{
  
}