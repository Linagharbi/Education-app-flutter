class Delay {
  Delay({
    this.inscription,
    this.definition,
    this.date,
    this.heure,
    this.duree,
    this.matiere,
    this.enseignant,
    this.vu,
    this.id,
  });

  int inscription;
  String definition;
  DateTime date;
  String heure;
  String duree;
  String matiere;
  String enseignant;
  bool vu;
  int id;

  factory Delay.fromJson(Map<String, dynamic> json) => Delay(
        inscription: json["Inscription"],
        definition: json["Definition"],
        date: DateTime.parse(json["Date"]),
        heure: json["Heure"],
        duree: json["Duree"],
        matiere: json["Matiere"],
        enseignant: json["Enseignant"],
        vu: json["Vu"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Inscription": inscription,
        "Definition": definition,
        "Date": date.toIso8601String(),
        "Heure": heure,
        "Duree": duree,
        "Matiere": matiere,
        "Enseignant": enseignant,
        "Vu": vu,
        "id": id,
      };
}
