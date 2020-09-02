// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

import 'package:education_app/src/models/discipline/absence.dart';
import 'package:education_app/src/models/discipline/blame.dart';
import 'package:education_app/src/models/discipline/delay.dart';
import 'package:education_app/src/models/discipline/warning.dart';
import 'package:education_app/src/models/payment/inscription.dart';
import 'package:education_app/src/models/payment/inscription_extra.dart';

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
    this.retards,
    this.absences,
    this.avertissements,
    this.blames,
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
  Inscription inscriptionEleve;
  InscriptionExtra cantine;
  InscriptionExtra bus;
  InscriptionExtra club;
  InscriptionExtra panier;
  List<Delay> retards;
  List<Absence> absences;
  List<Warning> avertissements;
  List<Blame> blames;

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
        inscriptionEleve: Inscription.fromJson(json["InscriptionEleve"]),
        cantine: json["Cantine"] == null
            ? null
            : InscriptionExtra.fromJson(
                json["Cantine"],
              ),
        bus: json["Bus"] == null
            ? null
            : InscriptionExtra.fromJson(
                json["Bus"],
              ),
        club: json["Club"] == null
            ? null
            : InscriptionExtra.fromJson(
                json["Club"],
              ),
        panier: json["Panier"] == null
            ? null
            : InscriptionExtra.fromJson(
                json["Panier"],
              ),
        retards: json["Retards"] == null
            ? null
            : List<Delay>.from(
                json["Retards"].map(
                  (x) => Delay.fromJson(x),
                ),
              ),
        absences: json["Absences"] == null
            ? null
            : List<Absence>.from(
                json["Absences"].map(
                  (x) => Absence.fromJson(x),
                ),
              ),
        avertissements: json["Avertissements"] == null
            ? null
            : List<Warning>.from(
                json["Avertissements"].map(
                  (x) => Warning.fromJson(x),
                ),
              ),
        blames: json["Blames"] == null
            ? null
            : List<Blame>.from(
                json["Blames"].map(
                  (x) => Blame.fromJson(x),
                ),
              ),
      );
}
