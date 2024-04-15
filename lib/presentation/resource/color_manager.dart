import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.fromHex("#17A9FD");
  static Color primaryOpacity70 = HexColor.fromHex("#B317A9FD");
  static Color primaryDark = HexColor.fromHex("#0165E1");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color black = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");

    if(hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}