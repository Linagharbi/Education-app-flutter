// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);
import 'dart:convert';
import 'package:education_app/src/models/inscription.dart';

List<Student> studentFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

class Student {
  Student({
    this.birthdate,
    this.frName,
    this.arName,
    this.studentId,
    this.parentId,
    this.personId,
    this.phone,
    this.inscription,
  });

  DateTime birthdate;
  String frName;
  String arName;
  int studentId;
  int parentId;
  int personId;
  int phone;
  Inscription inscription;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        birthdate: DateTime.parse(json["DateNaissance"]),
        frName: json["NomPrenomFR"],
        arName: json["NomPrenomAR"],
        studentId: json["IdEleve"],
        parentId: json["IdParent"],
        personId: json["id"],
        phone: json["Tel1"],
        inscription: Inscription.fromJson(json["InscriptionEleve"]),
      );
}
