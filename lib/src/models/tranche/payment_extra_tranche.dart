// To parse this JSON data, do
//
//     final paymentExtraTranche = paymentExtraTrancheFromJson(jsonString);

import 'dart:convert';

import 'package:education_app/src/models/tranche/reglement.dart';

List<PaymentExtraTranche> paymentExtraTrancheFromJson(String str) =>
    List<PaymentExtraTranche>.from(
        json.decode(str).map((x) => PaymentExtraTranche.fromJson(x)));

class PaymentExtraTranche {
  PaymentExtraTranche({
    this.paiementExtras,
    this.totalHt,
    this.tauxRemise,
    this.totalRemise,
    this.netHt,
    this.tauxTva,
    this.totalTva,
    this.totalTtc,
    this.montantRestant,
    this.motif,
    this.id,
    this.reglementEleve,
  });

  int paiementExtras;
  double totalHt;
  double tauxRemise;
  double totalRemise;
  double netHt;
  double tauxTva;
  double totalTva;
  double totalTtc;
  double montantRestant;
  String motif;
  int id;
  List<ReglementEleve> reglementEleve;

  factory PaymentExtraTranche.fromJson(Map<String, dynamic> json) =>
      PaymentExtraTranche(
        paiementExtras: json["PaiementExtras"],
        totalHt: json["TotalHT"].toDouble(),
        tauxRemise: json["TauxRemise"].toDouble(),
        totalRemise: json["TotalRemise"].toDouble(),
        netHt: json["NetHT"].toDouble(),
        tauxTva: json["TauxTVA"].toDouble(),
        totalTva: json["TotalTVA"].toDouble(),
        totalTtc: json["TotalTTC"].toDouble(),
        montantRestant: json["MontantRestant"].toDouble(),
        motif: json["Motif"],
        id: json["id"],
        reglementEleve: List<ReglementEleve>.from(
            json["reglementEleve"].map((x) => ReglementEleve.fromJson(x))),
      );
}
