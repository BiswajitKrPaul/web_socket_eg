import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_client/bloc/chat_bloc.dart';
import 'package:web_socket_client/chat_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ChatBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: ChatScreen(),
    );
  }
}
