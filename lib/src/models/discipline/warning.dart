class Warning {
  Warning({
    this.inscription,
    this.object,
    this.description,
    this.enseignant,
    this.date,
    this.matiere,
    this.id,
  });

  int inscription;
  String object;
  String description;
  String enseignant;
  DateTime date;
  String matiere;
  int id;

  factory Warning.fromJson(Map<String, dynamic> json) => Warning(
        inscription: json["Inscription"],
        object: json["Object"],
        description: json["Description"],
        enseignant: json["Enseignant"],
        date: DateTime.parse(json["Date"]),
        matiere: json["Matiere"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Inscription": inscription,
        "Object": object,
        "Description": description,
        "Enseignant": enseignant,
        "Date": date.toIso8601String(),
        "Matiere": matiere,
        "id": id,
      };
}
