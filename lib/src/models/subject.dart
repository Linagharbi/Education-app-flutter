class Subject {
  String date;
  String name;
  double amount;

  // Constructor
  Subject({
    this.date,
    this.name,
    this.amount,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      date: json['date'],
      name: json['name'],
      amount: json['amount'] as double,
    );
  }
}
