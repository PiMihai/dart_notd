import 'dart:math';
import 'lucky_number.dart';

class LuckyNumberGenerator {
  final Random r = new Random();
  final messages = <String> [ 
    "This one is really lucky!",
    "The odds are with you, my friend!",
    "Never have I ever guessed so good!",
    "Looks like the stars are shining on you today!",
    "Magical number, a great choice!"
  ];

  LuckyNumber generate() {
    var message = messages[r.nextInt(4)];
    var luckyNumber = r.nextInt(100);

    return new LuckyNumber()
      ..message = message
      ..number = luckyNumber;
  }
}