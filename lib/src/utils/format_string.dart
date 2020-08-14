extension FormatString on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String change() {
    return "yoyo";
  }
}
