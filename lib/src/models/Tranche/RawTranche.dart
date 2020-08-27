// To parse this JSON data, do
//
//     final rawTranche = rawTrancheFromJson(jsonString);

import 'dart:convert';

List<RawTranche> rawTrancheFromJson(String str) =>
    List<RawTranche>.from(json.decode(str).map((x) => RawTranche.fromJson(x)));

class RawTranche {
  RawTranche({
    this.motifPaiement,
    this.date,
    this.inscription,
    this.tranche,
    this.totalHt,
    this.tauxRemise,
    this.totalRemise,
    this.netHt,
    this.tauxTva,
    this.totalTva,
    this.totalTtc,
    this.montantRestant,
    this.id,
    this.reglementEleve,
  });

  dynamic motifPaiement;
  dynamic date;
  int inscription;
  String tranche;
  double totalHt;
  int tauxRemise;
  double totalRemise;
  double netHt;
  int tauxTva;
  double totalTva;
  double totalTtc;
  double montantRestant;
  int id;
  List<ReglementEleve> reglementEleve;

  factory RawTranche.fromJson(Map<String, dynamic> json) => RawTranche(
        motifPaiement: json["MotifPaiement"],
        date: json["date"],
        inscription: json["Inscription"],
        tranche: json["Tranche"],
        totalHt: json["TotalHT"].toDouble(),
        tauxRemise: json["TauxRemise"],
        totalRemise: json["TotalRemise"].toDouble(),
        netHt: json["NetHT"].toDouble(),
        tauxTva: json["TauxTVA"],
        totalTva: json["TotalTVA"].toDouble(),
        totalTtc: json["TotalTTC"].toDouble(),
        montantRestant: json["MontantRestant"].toDouble(),
        id: json["id"],
        reglementEleve: List<ReglementEleve>.from(
            json["reglementEleve"].map((x) => ReglementEleve.fromJson(x))),
      );
}

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
