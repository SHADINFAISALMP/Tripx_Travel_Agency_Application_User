import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final String adminId;

  ChatLoaded(this.adminId);

  @override
  List<Object?> get props => [adminId];
}

class ChatMessagesLoaded extends ChatState {
  final List<QueryDocumentSnapshot> messages;

  ChatMessagesLoaded(this.messages);

  @override
  List<Object?> get props => [messages];
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);

  @override
  List<Object?> get props => [message];
}
