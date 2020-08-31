// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

// ignore: todo
// TODO: Move Inscription & PaimentExtra to separate files
// change field names and remove unused fields

import 'dart:convert';

List<Student> studentFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

class Student {
  Student({
    this.nomPrenomFr,
    this.nomPrenomAr,
    this.tel1,
    this.idParent,
    this.idEleve,
    this.idInscription,
    this.anneeScolaire,
    this.idCantine,
    this.idBus,
    this.idClub,
    this.idPanier,
    this.inscriptionEleve,
    this.cantine,
    this.bus,
    this.club,
    this.panier,
  });

  String nomPrenomFr;
  String nomPrenomAr;
  int tel1;
  int idParent;
  int idEleve;
  int idInscription;
  String anneeScolaire;
  int idCantine;
  int idBus;
  int idClub;
  int idPanier;
  InscriptionEleve inscriptionEleve;
  PaimentExtra cantine;
  PaimentExtra bus;
  PaimentExtra club;
  PaimentExtra panier;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        nomPrenomFr: json["NomPrenomFR"],
        nomPrenomAr: json["NomPrenomAR"],
        tel1: json["Tel1"],
        idParent: json["IdParent"],
        idEleve: json["IdEleve"],
        idInscription: json["Inscription"],
        anneeScolaire: json["AnneeScolaire"],
        idCantine: json["IdCantine"] == null ? null : json["IdCantine"],
        idBus: json["IdBus"] == null ? null : json["IdBus"],
        idClub: json["IdClub"] == null ? null : json["IdClub"],
        idPanier: json["IdPanier"] == null ? null : json["IdPanier"],
        inscriptionEleve: InscriptionEleve.fromJson(json["InscriptionEleve"]),
        cantine: json["Cantine"] == null
            ? null
            : PaimentExtra.fromJson(json["Cantine"]),
        bus: json["Bus"] == null ? null : PaimentExtra.fromJson(json["Bus"]),
        club: json["Club"] == null ? null : PaimentExtra.fromJson(json["Club"]),
        panier: json["Panier"] == null
            ? null
            : PaimentExtra.fromJson(json["Panier"]),
      );
}

class PaimentExtra {
  PaimentExtra({
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

  factory PaimentExtra.fromJson(Map<String, dynamic> json) => PaimentExtra(
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

class InscriptionEleve {
  InscriptionEleve({
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

  factory InscriptionEleve.fromJson(Map<String, dynamic> json) =>
      InscriptionEleve(
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
