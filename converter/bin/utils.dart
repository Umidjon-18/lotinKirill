import 'dart:io';
import 'package:colorize/colorize.dart';

class Utils {
  void printModel(Colorize text) {
    print(greenColor(
        '''-----------------------------------------------------------------------------------------------------------------
|                                                                                                               |'''));
    print("  $text");
    print(greenColor(
        '''|                                                                                                               |
-----------------------------------------------------------------------------------------------------------------'''));
  }

  void printModel2(Colorize text) {
    print(greenColor(
        '''-----------------------------------------------------------------------------------------------------------------'''));
    print("  $text");
    print(greenColor(
        '''-----------------------------------------------------------------------------------------------------------------'''));
  }

  Colorize greenColor(String text) {
    return Colorize(text).green().bold().italic();
  }

   Colorize redColor2(String text) {
    return Colorize(text).red().bold().italic();
  }

  clear() {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}
