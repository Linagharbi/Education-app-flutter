class Inscription {
  Inscription({
    this.eleve,
    this.classe,
    this.modalite,
    this.date,
    this.anneeScolaire,
    this.personne,
    this.ttcScolaire,
    this.restantScolaire,
    this.solde,
    this.typeInscri,
    this.id,
  });

  int eleve;
  int classe;
  int modalite;
  dynamic date;
  int anneeScolaire;
  int personne;
  double ttcScolaire;
  double restantScolaire;
  double solde;
  String typeInscri;
  int id;

  factory Inscription.fromJson(Map<String, dynamic> json) => Inscription(
        eleve: json["Eleve"],
        classe: json["Classe"],
        modalite: json["Modalite"],
        date: json["Date"],
        anneeScolaire: json["AnneeScolaire"],
        personne: json["Personne"],
        ttcScolaire: json["TTC_Scolaire"].toDouble(),
        restantScolaire: json["Restant_Scolaire"].toDouble(),
        solde: json["Solde"].toDouble(),
        typeInscri: json["TypeInscri"],
        id: json["id"],
      );
}
