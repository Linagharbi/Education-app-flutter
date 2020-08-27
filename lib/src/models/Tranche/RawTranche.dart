// To parse this JSON data, do
//
//     final rawTranche = rawTrancheFromJson(jsonString);

import 'dart:convert';

// TODO:
// http://api.elite2com.com:3000/api/Paiements?filter[where][Inscription]=205
// http://api.elite2com.com:3000/api/reglementeleves?filter[where][IdInscription]=816&filter[include]=modeReglement

// Merge Both

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
      );
}
