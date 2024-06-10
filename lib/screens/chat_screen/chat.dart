// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_bloc.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_event.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_state.dart';
import 'package:tripx_user_application/screens/chat_screen/chat_Service.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String adminId;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(ChatService())..add(LoadMessages()),
      child: Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          backgroundColor: colorteal,
          toolbarHeight: 80,
          titleSpacing: 20,
          automaticallyImplyLeading: false,
          title: Text(
            'CHAT WITH TRIPX',
            style: TextStyle(
                color: whitecolor,
                fontWeight: FontWeight.bold,
                fontFamily: bodoni),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  final Uri url = Uri(scheme: 'tel', path: '9072051005');

                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "can't do the call",
                        style: TextStyle(color: colorteal),
                      ),
                      backgroundColor: whitecolor,
                    ));
                  }
                },
                icon: const Icon(
                  Icons.phone_in_talk,
                  color: whitecolor,
                )),
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ),
              onSelected: (value) {
                if (value == 'clear') {}
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'clear',
                    child: Text('Clear Messages'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                    color: colorteal, size: 60),
              );
            } else if (state is ChatLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: _buildMessagelist(state.messages),
                  ),
                  _buildMessageinput(context),
                ],
              );
            } else if (state is ChatError) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildMessageinput(BuildContext context) {
    final TextEditingController _messagecontroller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messagecontroller,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.message,
                    color: colorteal,
                    size: 30,
                  ),
                  hintText: 'Type a message.....',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: colorteal,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: colorteal,
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    color: colorteal,
                    iconSize: 35,
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      context
                          .read<ChatBloc>()
                          .add(SendMessage(_messagecontroller.text));
                      _messagecontroller.clear();
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    bool isSentByMe = data['senderid'] == currentUserId;

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ChatBubble(
        message: data['message'],
        timestamp: data['timestamp'],
        isSentByMe: isSentByMe,
      ),
    );
  }

   Widget _buildMessagelist(List<DocumentSnapshot> documents) {
    return ListView(
      children: documents.map((document) => _buildMessageitem(document)).toList(),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final Timestamp timestamp;
  final bool isSentByMe;

  const ChatBubble({
    super.key,
    required this.message,
    required this.timestamp,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm a').format(timestamp.toDate());

    return Container(
      margin: isSentByMe
          ? EdgeInsets.only(left: 50, top: 10, bottom: 10, right: 10)
          : EdgeInsets.only(right: 50, top: 10, bottom: 10, left: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: isSentByMe
            ? LinearGradient(
                colors: [Colors.teal.shade300, Colors.teal.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [
                  Colors.teal.shade700,
                  Colors.teal.shade300,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: isSentByMe
            ? BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 18,
              color: isSentByMe ? Colors.white : Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            formattedTime,
            style: TextStyle(
              fontSize: 12,
              color: isSentByMe ? Colors.white70 : Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
