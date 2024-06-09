import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAdminId extends ChatEvent {}

class SendMessage extends ChatEvent {
  final String message;

  SendMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class LoadMessages extends ChatEvent {}
