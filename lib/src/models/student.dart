import 'package:education_app/src/models/inscription.dart';

class Student {
  int studentId;
  int parentId;
  int personId;
  int phone;

  String birthdate;
  String frName;
  String arName;

  Inscription inscription;

  Student({
    this.studentId,
    this.parentId,
    this.personId,
    this.phone,
    this.birthdate,
    this.frName,
    this.arName,
    this.inscription,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      studentId: json['IdEleve'] as int,
      parentId: json['IdParent'] as int,
      personId: json['id'] as int,
      phone: json['Tel1'] as int,
      birthdate: json['DateNaissance'],
      frName: json['NomPrenomFR'],
      arName: json['NomPrenomAR'],
      inscription: json['InscriptionEleve'],
    );
  }
}
