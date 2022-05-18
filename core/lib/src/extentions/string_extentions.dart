extension StringExtentions on String {
  String get flavorString {
    List<String> paths = this.split(".");
    return paths[paths.length - 1];
  }

  String? orEmpty() {
    return this;
  }

  bool toBool() {
    return this.toLowerCase() == 'true';
  }

  int toIntorNull() {
    return int.tryParse(this)!;
  }

  double toDoubleOrNull() {
    return double.tryParse(this)!;
  }
}
