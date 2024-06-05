import 'package:equatable/equatable.dart';

abstract class HotelState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final List<dynamic> hotelDetails;

  HotelLoaded(this.hotelDetails);

  @override
  List<Object?> get props => [hotelDetails];
}

class HotelError extends HotelState {
  final String message;

  HotelError(this.message);

  @override
  List<Object?> get props => [message];
}
