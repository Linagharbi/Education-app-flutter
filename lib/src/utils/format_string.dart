extension FormatString on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String toCamelCase() {
    String someString = this
        .replaceAllMapped(
            RegExp(
                r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
            (Match m) =>
                "${m[0][0].toUpperCase()}${m[0].substring(1).toLowerCase()}")
        .replaceAll(RegExp(r'(_|-|\s)+'), ' ');
    return someString;
  }
}
