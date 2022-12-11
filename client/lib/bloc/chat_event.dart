part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.newMessage({required String newTxt}) = _NewMessage;
  const factory ChatEvent.sendMessage({required String message}) = _SendMessage;
}
