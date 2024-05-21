part of 'package_bloc.dart';

@immutable
sealed class PackageEvent {}

class UpdateNumberofadults extends PackageEvent {
  final int numberofAdults;

  UpdateNumberofadults(this.numberofAdults);
}

class UpdateNumberofChildrens extends PackageEvent {
  final int numberofchildren;

  UpdateNumberofChildrens(this.numberofchildren);
}

class UpdateNumberrooms extends PackageEvent {
  final int numberofrooms;

  UpdateNumberrooms(this.numberofrooms);
}

class SavePackageDetails extends PackageEvent {}

class SubmitTravelPackage extends PackageEvent {
  final Travelpackage travelPackage;

  SubmitTravelPackage(this.travelPackage);
}
