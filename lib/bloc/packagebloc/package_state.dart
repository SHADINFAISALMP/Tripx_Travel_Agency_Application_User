part of 'package_bloc.dart';

@immutable
sealed class PackageState {}

final class PackageInitial extends PackageState {}

class PackageLoading extends PackageState {}

class Packagesucess extends PackageState {}

class Packageerror extends PackageState {
  final String errorMessage;

  Packageerror(this.errorMessage);
}

class PackageUpdated extends PackageState {
  final int adultcount;
  final int childrencount;
  final int roomscount;
  final Travelpackage travelpackage;
  PackageUpdated(
      {required this.adultcount,
      required this.childrencount,
      required this.roomscount,
      required this.travelpackage});
}

class PackageSaved extends PackageState {
  final Travelpackage travelPackage;

  PackageSaved(this.travelPackage);
}
