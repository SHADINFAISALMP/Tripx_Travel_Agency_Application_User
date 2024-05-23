part of 'package_bloc.dart';

class PackageEvent {
  final Travelpackage? travelpackage;

  PackageEvent({this.travelpackage});
}

class UpdateAdultsCount extends PackageEvent {
  final int count;

  UpdateAdultsCount(this.count);
}

class UpdateChildrenCount extends PackageEvent {
  final int count;

  UpdateChildrenCount(this.count);
}

class UpdateRoomsCount extends PackageEvent {
  final int count;

  UpdateRoomsCount(this.count);
}

class FetchInitialData extends PackageEvent {}

class SavePackageDetails extends PackageEvent {}

class SubmitTravelPackage extends PackageEvent {
  final Travelpackage travelPackage;

  SubmitTravelPackage(this.travelPackage);
}
