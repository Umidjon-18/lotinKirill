import 'dart:io';
import 'consts.dart';
import 'utils.dart';

class App {
  var alifbo = Consts().alifbo;
  Utils utils = Utils();
  convertToKirill() {
    utils.printModel(utils.greenColor('''  1) Faylga yozish

    2) Consoleda ko'rish'''));
    var option = stdin.readLineSync()!.trim();
    utils.printModel(utils.greenColor("Matnni kiriting"));
    var text = stdin.readLineSync()!.split("").toList();
    text.add(" ");
    text.insert(0, " ");
    for (int i = 0; i < text.length - 1; i++) {
      if (text[i] == "e" || text[i] == "E") {
        var item = text[i - 1].codeUnitAt(0);
        if ((item > 64 || item < 123) && (item < 91 || item > 96)) {
          text[i] = (text[i] == "e") ? "е" : "E";
        } else {
          text[i] = (text[i] == "e") ? "э" : "Э";
        }
        if (text[i - 1] == " ") {
          text[i] = (text[i] == "E") ? "Э" : "э";
        }
      }
      switch (text[i]) {
        case "S":
          if (text[i + 1] == "H" || text[i + 1] == "h") {
            text.replaceRange(i, i + 2, ["Ш"]);
            i--;
          }
          break;
        case "s":
          if (text[i + 1] == "H" || text[i + 1] == "h") {
            text.replaceRange(i, i + 2, ["ш"]);
            i--;
          }
          break;
        case "C":
          if (text[i + 1] == "H" || text[i + 1] == "h") {
            text.replaceRange(i, i + 2, ["Ч"]);
            i--;
          }
          break;
        case "c":
          if (text[i + 1] == "H" || text[i + 1] == "h") {
            text.replaceRange(i, i + 2, ["ч"]);
            i--;
          }
          break;
        case "G":
          if (text[i + 1] == "'") {
            text.replaceRange(i, i + 2, ["Ғ"]);
            i--;
          }
          break;
        case "g":
          if (text[i + 1] == "'") {
            text.replaceRange(i, i + 2, ["ғ"]);
            i--;
          }
          break;
        case "O":
          if (text[i + 1] == "'") {
            text.replaceRange(i, i + 2, ["Ў"]);
            i--;
          }
          break;
        case "o":
          if (text[i + 1] == "'") {
            text.replaceRange(i, i + 2, ["ў"]);
            i--;
          }
          break;
        case "Y":
          if (text[i + 1] == "A" || text[i + 1] == "a") {
            text.replaceRange(i, i + 2, ["Я"]);
            i--;
          }
          if (text[i + 1] == "U" || text[i + 1] == "u") {
            text.replaceRange(i, i + 2, ["Ю"]);
            i--;
          }
          if (text[i + 1] == "O" || text[i + 1] == "o") {
            text.replaceRange(i, i + 2, ["Ё"]);
            i--;
          }
          if (text[i + 1] == "E" || text[i + 1] == "e") {
            text.replaceRange(i, i + 2, ["Е"]);
            i--;
          }
          break;
        case "y":
          if (text[i + 1] == "A" || text[i + 1] == "a") {
            text.replaceRange(i, i + 2, ["я"]);
            i--;
          }
          if (text[i + 1] == "U" || text[i + 1] == "u") {
            text.replaceRange(i, i + 2, ["ю"]);
            i--;
          }
          if (text[i + 1] == "O" || text[i + 1] == "o") {
            text.replaceRange(i, i + 2, ["ё"]);
            i--;
          }
          if (text[i + 1] == "E" || text[i + 1] == "e") {
            text.replaceRange(i, i + 2, ["е"]);
            i--;
          }
          break;
      }
      if (alifbo!.containsKey(text[i])) {
        text[i] = alifbo![text[i]];
      }
    }
    var result = text.join("");

    if (option == "1") {
      var now =
          "${DateTime.now().minute}-${DateTime.now().second}-${DateTime.now().millisecond}";

      var file = File("../src/kirill-$now.text");
      file.writeAsStringSync("✅ $result");
      utils.clear();
      utils.printModel(utils
          .greenColor("✅ Sizning faylingiz saqlangan joy \n\n  ${file.path}"));
    } else if (option == "2") {
      utils.clear();
      utils.printModel(utils.greenColor(" ✅ Natija\n\n    $result"));
    } else {
      utils.printModel2(utils.redColor2("❌ Noto'g'ri buyruq kiritildi!"));
    }
    utils.printModel2(utils.redColor2(
        "Davom etish uchun Enter | Chiqish uchun boshqa istalgan tugmani bosing"));
    var check = stdin.readLineSync()!.trim();
    if (check.isEmpty) {
      utils.clear();
      convertToKirill();
    } else {
      utils.clear();
      exit(0);
    }
  }
}
