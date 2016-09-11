import 'dart:io';
import 'package:dart_notd_common/notd_common.dart';

main(List<String> args) async {
  if(args.isEmpty) {
    print("Error - no port specified as first argument.");
    return;
  }
  final port = int.parse(args.first);
  final requestServer = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, port);

  await for (final request in requestServer) {
    handle(request);
  }
}

void handle(HttpRequest request) {
  print("Got request at ${request.requestedUri.path}");
  request.response.headers.add("Access-Control-Allow-Origin", "*");
  if(request.method != "GET" ||
    request.requestedUri.path != "/lucky") {
      request.response.headers.contentType = ContentType.HTML;
      request.response..write("you're in the wrong place, try <a href=\"/lucky\">/lucky</a>")..close();
      return;
  }
  request.response
    ..write(new LuckyNumberGenerator().generate())
    ..close();
}