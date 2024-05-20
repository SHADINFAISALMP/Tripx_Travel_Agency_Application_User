part of 'package_bloc.dart';

@immutable
sealed class PackageState {}

final class PackageInitial extends PackageState {}

class PackageLoaded extends PackageState {
  final QueryDocumentSnapshot<Object?> itemlists;

  PackageLoaded(this.itemlists);
}

class Packageerror extends PackageState {
  final String errorMessage;

  Packageerror(this.errorMessage);
}
class Justloading extends PackageState{}