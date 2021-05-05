import 'package:flutter/cupertino.dart';

class AppUtils {
  static TextStyle getFontMaisonBold({double fontSize, Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'maison_bold',
        color: textColor
    );
  }

  static TextStyle getFontMaisonLight({double fontSize, Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'maison',
        color: textColor
    );
  }
}
