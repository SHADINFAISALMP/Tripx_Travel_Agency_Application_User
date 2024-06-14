// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_bloc.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_event.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_state.dart';
import 'package:tripx_user_application/screens/chat_screen/chat_Service.dart';
import 'package:tripx_user_application/screens/chat_screen/chat_bubble.dart';
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
    final TextEditingController messagecontroller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messagecontroller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
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
                    borderSide: const BorderSide(
                      color: colorteal,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
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
                          .add(SendMessage(messagecontroller.text));
                      messagecontroller.clear();
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    bool isSentByMe = data['senderid'] == currentUserId;

    bool isDeletded = data['isdeleted'] ?? false;
    if (isDeletded) {
      return Container(
        alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          'This message was deleted',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.grey[400],
          ),
        ),
      );
    }
    return Dismissible(
      key: Key(document.id),
      direction:
          isSentByMe ? DismissDirection.endToStart : DismissDirection.none,
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: whitecolor,
              title: const Text(
                'Delete Message',
                style: TextStyle(color: colorteal),
              ),
              content: const Text(
                'Are you sure you want to delete this message?',
                style: TextStyle(color: colorteal),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: colorteal),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<ChatBloc>().add(DeleteMessage(document));
                    Navigator.of(context).pop(true);
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        ).then((value) {
          if (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: orangecolor,
                  content: Center(
                      child: Text(
                    'Message deleted',
                    style: TextStyle(
                        color: whitecolor, fontWeight: FontWeight.bold),
                  ))),
            );
          }
          return value;
        });
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: GestureDetector(
        onTap: () async {},
        child: Align(
          alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: ChatBubble(
            message: data['message'],
            timestamp: data['timestamp'],
            isSentByMe: isSentByMe,
          ),
        ),
      ),
    );
  }

  Widget _buildMessagelist(List<DocumentSnapshot> documents) {
    if (documents.isEmpty) {
      return const Center(
        child: Text(
          'No messages yet',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    } else {
      return ListView(
        children:
            documents.map((document) => _buildMessageItem(document)).toList(),
      );
    }
  }
}
