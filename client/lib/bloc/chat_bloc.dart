import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late final WebSocketChannel channel;
  ChatBloc() : super(const ChatState(chats: [])) {
    on<_NewMessage>((event, emit) {
      log('Event :: $event');
      final newChat = [...state.chats];
      newChat.add(event.newTxt);
      emit(state.copyWith(chats: [...newChat]));
    });

    on<_SendMessage>((event, emit) {
      channel.sink.add(event.message);
    });

    final uri = Uri.parse('ws://192.168.29.154:8080/ws');
    channel = WebSocketChannel.connect(uri);

    channel.stream.listen((event) {
      log('Stream :: $event');
      add(ChatEvent.newMessage(newTxt: event));
    });
  }

  @override
  Future<void> close() {
    channel.sink.close();
    return super.close();
  }
}
