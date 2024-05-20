part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class Profileloading extends ProfileState {}

final class Profileupdated extends ProfileState {}

final class ProfileEror extends ProfileState {
  final String error;

  ProfileEror(this.error);
  
}
