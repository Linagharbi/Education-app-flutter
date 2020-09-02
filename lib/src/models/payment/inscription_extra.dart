class InscriptionExtra {
  InscriptionExtra({
    this.date,
    this.inscription,
    this.totalHt,
    this.tauxRemise,
    this.totalRemise,
    this.netHt,
    this.tauxTva,
    this.totalTva,
    this.totalTtc,
    this.montantRestant,
    this.paiementmotif,
    this.personne,
    this.anneeScolaire,
    this.classe,
    this.modalite,
    this.id,
  });

  dynamic date;
  int inscription;
  double totalHt;
  double tauxRemise;
  double totalRemise;
  double netHt;
  double tauxTva;
  double totalTva;
  double totalTtc;
  double montantRestant;
  int paiementmotif;
  int personne;
  int anneeScolaire;
  int classe;
  int modalite;
  int id;

  factory InscriptionExtra.fromJson(Map<String, dynamic> json) =>
      InscriptionExtra(
        date: json["date"],
        inscription: json["Inscription"],
        totalHt: json["TotalHT"].toDouble(),
        tauxRemise: json["TauxRemise"].toDouble(),
        totalRemise: json["TotalRemise"].toDouble(),
        netHt: json["NetHT"].toDouble(),
        tauxTva: json["TauxTVA"].toDouble(),
        totalTva: json["TotalTVA"].toDouble(),
        totalTtc: json["TotalTTC"].toDouble(),
        montantRestant: json["MontantRestant"].toDouble(),
        paiementmotif: json["paiementmotif"],
        personne: json["Personne"],
        anneeScolaire: json["AnneeScolaire"],
        classe: json["Classe"],
        modalite: json["Modalite"],
        id: json["id"],
      );
}
