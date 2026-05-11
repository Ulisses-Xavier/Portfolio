class LocalText {
  final String pt;
  final String en;

  const LocalText({required this.pt, required this.en});

  String get(String lang) {
    return lang == "pt" ? pt : en;
  }
}
