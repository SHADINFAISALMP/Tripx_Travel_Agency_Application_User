part of 'package_bloc.dart';

@immutable
sealed class PackageState {}

final class PackageInitial extends PackageState {}

class PackageLoaded extends PackageState {
  final Map<String, dynamic> packageDetails;
  PackageLoaded(this.packageDetails);
}

class PackageLoading extends PackageState {}

class Packagesucess extends PackageState {}

class Packageerror extends PackageState {
  final String errorMessage;

  Packageerror(this.errorMessage);
}
class PackageUpdated extends PackageState {
  final int adultsCount;
  final int childrenCount;
  final int roomsCount;

  PackageUpdated(this.adultsCount, this.childrenCount, this.roomsCount);
}