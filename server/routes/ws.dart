import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

List<WebSocketChannel> channels = [];

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    channel.stream.listen((message) {
      final msg = message as String;
      broadcastChannel(msg);
    });
    channels.add(channel);
    channel.sink.add('Hi');
  });

  return handler(context);
}

void broadcastChannel(String message) {
  for (final channel in channels) {
    channel.sink.add(message);
  }
}
