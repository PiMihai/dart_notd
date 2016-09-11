import "dart:html";
import "package:dart_notd_common/notd_common.dart";

final baseUrl = '';

main() {
  final request = new HttpRequest();
  request
    ..open("GET", "$baseUrl/lucky")
    ..onLoadEnd.listen((_) => showGuess(request.responseText))
    ..send();
}

void showGuess(String jsonGuess) {
  final guess = new LuckyNumber()..initFromJson(jsonGuess);
  querySelector("#number").text = guess.number.toString();
  querySelector("#message").text = guess.message;
}