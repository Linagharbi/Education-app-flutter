class Inscription {
  int id;
  double priceTotal;
  double pricePaid;
  double priceLeft;

  Inscription({this.id, this.priceTotal, this.pricePaid, this.priceLeft});

  factory Inscription.fromJson(Map<String, dynamic> json) {
    return Inscription(
      id: json['id'] as int,
      priceTotal: json['TTC_Scolaire'] as double,
      pricePaid: json['Solde'] as double,
      priceLeft: json['Restant_Scolaire'] as double,
    );
  }
}
