/*
enum Font {
  Play_Fair_Normal,
  Play_Fair_Italic
}

extension FontExtension on Font {

  String get font {
    switch (this) {
      case Font.Play_Fair_Normal:
        return 'Play Fair';
      default:
        return "";
    }
  }
}*/

enum FontsFamily {
  Play_Fair_Normal("Play Fair"),
  Play_Fair_Italic("Play Fair");

  const FontsFamily(this.value);
  final String value;
}