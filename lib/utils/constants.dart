import 'dart:ui';

class DesignColors {
  static const secondaryColor =  Color(0xFF976f1f);
  static const primaryColor = Color(0xff0d5c58);
  static const midCircleDarkBlue = Color(0xDD151B4A);
  static const backgroundLeftSide = Color(0xFF030728);
  static const backgroundRightSide = Color(0xFF0E184A);
  static const textColor = Color(0xFF808CBA);
  static const activeTextColor = Color(0xFFD1D8F3);
}

  List<Color> get gradientColor {
    return <Color>[
            const Color(0xff0d5c58),
          
            const Color.fromARGB(255, 21, 168, 161),
          ];
  }