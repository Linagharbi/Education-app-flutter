// To parse this JSON data, do
//
//     final paymentTranche = paymentTrancheFromJson(jsonString);

import 'dart:convert';

import 'package:education_app/src/models/tranche/reglement.dart';

List<PaymentTranche> paymentTrancheFromJson(String str) =>
    List<PaymentTranche>.from(
        json.decode(str).map((x) => PaymentTranche.fromJson(x)));

class PaymentTranche {
  PaymentTranche({
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
  double tauxRemise;
  double totalRemise;
  double netHt;
  double tauxTva;
  double totalTva;
  double totalTtc;
  double montantRestant;
  int id;
  List<ReglementEleve> reglementEleve;

  factory PaymentTranche.fromJson(Map<String, dynamic> json) => PaymentTranche(
        motifPaiement: json["MotifPaiement"],
        date: json["date"],
        inscription: json["Inscription"],
        tranche: json["Tranche"],
        totalHt: json["TotalHT"].toDouble(),
        tauxRemise: json["TauxRemise"].toDouble(),
        totalRemise: json["TotalRemise"].toDouble(),
        netHt: json["NetHT"].toDouble(),
        tauxTva: json["TauxTVA"].toDouble(),
        totalTva: json["TotalTVA"].toDouble(),
        totalTtc: json["TotalTTC"].toDouble(),
        montantRestant: json["MontantRestant"].toDouble(),
        id: json["id"],
        reglementEleve: List<ReglementEleve>.from(
            json["reglementEleve"].map((x) => ReglementEleve.fromJson(x))),
      );
}
