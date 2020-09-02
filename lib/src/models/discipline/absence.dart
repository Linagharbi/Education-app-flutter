class Absence {
  Absence({
    this.inscription,
    this.definition,
    this.date,
    this.periode,
    this.duree,
    this.vu,
    this.id,
  });

  int inscription;
  String definition;
  DateTime date;
  String periode;
  String duree;
  bool vu;
  int id;

  factory Absence.fromJson(Map<String, dynamic> json) => Absence(
        inscription: json["Inscription"],
        definition: json["Definition"],
        date: DateTime.parse(json["Date"]),
        periode: json["Periode"],
        duree: json["Duree"],
        vu: json["Vu"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Inscription": inscription,
        "Definition": definition,
        "Date": date.toIso8601String(),
        "Periode": periode,
        "Duree": duree,
        "Vu": vu,
        "id": id,
      };
}
