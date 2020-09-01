class ReglementEleve {
  ReglementEleve({
    this.date,
    this.modeReglement,
    this.numCheque,
    this.proprietaire,
    this.montant,
    this.idInscription,
    this.idExtra,
    this.personne,
    this.utilisateur,
    this.dateEcheance,
    this.banque,
    this.observation,
    this.regInscri,
    this.typeReglement,
    this.remboursement,
    this.id,
  });

  DateTime date;
  int modeReglement;
  String numCheque;
  dynamic proprietaire;
  int montant;
  int idInscription;
  dynamic idExtra;
  int personne;
  int utilisateur;
  DateTime dateEcheance;
  int banque;
  dynamic observation;
  int regInscri;
  int typeReglement;
  int remboursement;
  int id;

  factory ReglementEleve.fromJson(Map<String, dynamic> json) => ReglementEleve(
        date: DateTime.parse(json["Date"]),
        modeReglement: json["ModeReglement"],
        numCheque: json["NumCheque"],
        proprietaire: json["Proprietaire"],
        montant: json["Montant"],
        idInscription: json["IdInscription"],
        idExtra: json["IdExtra"],
        personne: json["Personne"],
        utilisateur: json["Utilisateur"],
        dateEcheance: DateTime.parse(json["DateEcheance"]),
        banque: json["Banque"],
        observation: json["Observation"],
        regInscri: json["RegInscri"],
        typeReglement: json["TypeReglement"],
        remboursement: json["Remboursement"],
        id: json["id"],
      );
}
