import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_event.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_state.dart';
import 'package:tripx_user_application/screens/chat_screen/chat_Service.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatService _chatService;

  ChatBloc(this._chatService) : super(ChatInitial()) {
    on<FetchAdminId>(_onFetchAdminId);
    on<SendMessage>(_onSendMessage);
    on<LoadMessages>(_onLoadMessages);
  }

  Future<void> _onFetchAdminId(FetchAdminId event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      DocumentSnapshot adminDoc = await FirebaseFirestore.instance
          .collection('admindetails')
          .doc('admin')
          .get();
      String adminId = adminDoc.id;
      emit(ChatLoaded(adminId));
    } catch (e) {
      emit(ChatError("Failed to load admin ID"));
    }
  }

  Future<void> _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    try {
      if (state is ChatLoaded) {
        String adminId = (state as ChatLoaded).adminId;
        await _chatService.sendMessage(adminId, event.message);
        print('SendMessage event handled successfully');
      }
    } catch (e) {
      print('Failed to handle SendMessage event: $e');
      emit(ChatError("Failed to send message"));
    }
  }

  Future<void> _onLoadMessages(LoadMessages event, Emitter<ChatState> emit) async {
    try {
      if (state is ChatLoaded) {
        String adminId = (state as ChatLoaded).adminId;
        String currentUserId = FirebaseAuth.instance.currentUser!.uid;
        Stream<QuerySnapshot> messagesStream = _chatService.getMessages(adminId, currentUserId);

        await emit.forEach<QuerySnapshot>(
          messagesStream,
          onData: (snapshot) => ChatMessagesLoaded(snapshot.docs),
          onError: (error, stackTrace) => ChatError("Failed to load messages"),
        );
      }
    } catch (e) {
      emit(ChatError("Failed to load messages"));
    }
  }
}
