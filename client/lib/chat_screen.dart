import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_client/bloc/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          log(state.toString());
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.chats.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(state.chats[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<ChatBloc>().add(ChatEvent.sendMessage(
            message: math.Random().nextInt(1000).toString()));
      }),
    );
  }
}
