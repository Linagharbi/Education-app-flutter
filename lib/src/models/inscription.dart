class Inscription {
  int id;
  double priceTotal;
  double pricePaid;
  double priceLeft;

  Inscription({
    this.id,
    this.priceTotal,
    this.pricePaid,
    this.priceLeft,
  });

  factory Inscription.fromJson(Map<String, dynamic> json) => Inscription(
        id: json["id"],
        priceTotal: json["TTC_Scolaire"].toDouble(),
        pricePaid: json["Solde"].toDouble(),
        priceLeft: json["Restant_Scolaire"].toDouble(),
      );
}
