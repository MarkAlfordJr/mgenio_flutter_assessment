import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mgenio_app_assessment/Domain/Repositories/home_view_repo.dart';

class HomeViewRepoImpl implements HomeViewRepo {

  String decodedMessage = '';
  Map<String,String> lettersToMorse = {
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--..",
  ".": ".-.-.-",
  "!": "-.-.--",
  "?": "..--..",
  ",": "--..--"
  };


  @override
  String decodeMorse(String text) {
    // to reset the messagte everytime
    decodedMessage = '';
    if (text == "") {
      return "Oops, no morse code!";
    }
    // split the string into an array
    var morseCodeArray = text.split(" ");
    Map<String,String> morseToLetter = {};
    /// loop through [lettersToMorse] map
    /// add its values as the keys for morseToLetter dict
    lettersToMorse.forEach((letters, morseChars) {
      morseToLetter[morseChars] = letters;
    });
    // loop through the morseCodeArray
    for (var morsChar in morseCodeArray) {
        // if the morseToLetter key is not emoty, add it to the decoded message
        if (morseToLetter[morsChar] != null) {
          final letterChar = morseToLetter[morsChar];
          decodedMessage += letterChar!;
        } else {
          decodedMessage += " ";
        }
    }
    text = "";
    return decodedMessage;
  }
}

final homeViewRepoProvider = Provider((ref) => HomeViewRepoImpl());