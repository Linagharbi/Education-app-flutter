import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:education_app/src/models/Tranche/RawTranche.dart';
import 'package:education_app/src/models/student.dart';
import 'package:education_app/src/models/user.dart';
import 'package:http/http.dart';

class HttpService {
  // Local development
  final String myUrl = "http://192.168.1.200:3000/";
  // final String myUrl = "http://api.elite2com.com:3000/";

  //--------------------------GET Methods-----------------------------------//
  // Get a list of all users
  Future<List<User>> getAllUsers() async {
    try {
      String urlPersonnes = myUrl + "api/Personnes";
      Response res = await get(urlPersonnes);
      if (res.statusCode == 200) {
        // Successfull get request
        List<dynamic> body = jsonDecode(res.body);
        List<User> users = body
            .map(
              (dynamic item) => User.fromJson(item),
            )
            .toList();
        return users;
      } else {
        print("http_service: getAllUsers() => ${res.statusCode} ");
        return null;
      }
    } catch (e) {
      print("http_service: Error fetching all users!");
      return null;
    }
  }

  // Get a list of all students(children) from a parent id
  Future<List<Student>> getChildren(int parentId) async {
    try {
      String urlEnfants = myUrl +
          "api/ViewGetElevesParParents?filter[where][IdParent]=$parentId&filter[include]=InscriptionEleve";
      Response res = await get(urlEnfants);
      if (res.statusCode == 200) {
        // Successfull get request
        final List<Student> students = studentFromJson(res.body);
        return students;
      } else {
        print("http_service: getChildren() => ${res.statusCode} ");
        return null;
      }
    } catch (e) {
      print("http_service: Error fetching children!");
      return null;
    }
  }

  // Get a list of all tranches from inscription id
  Future<List<RawTranche>> getTranches(int inscriptionId) async {
    try {
      String urlInscription = myUrl +
          "api/Paiements?filter[where][Inscription]=$inscriptionId&filter[include]=reglementEleve";
      Response res = await get(urlInscription);
      if (res.statusCode == 200) {
        // Successfully get request
        final List<RawTranche> tranches = rawTrancheFromJson(res.body);
        return tranches;
      } else {
        print("http_service: getTranches() => ${res.statusCode} ");
        return null;
      }
    } catch (e) {
      print("http_service: Error fetching tranches!");
      return null;
    }
  }

  //--------------------------POST Methods-----------------------------------//
  void postSomething() {
    print("Posting Data");
  }

  //--------------------------Other Methods-----------------------------------//
  // Check connection to api server
  Future<bool> checkConnection() async {
    int timeout = 5;
    try {
      Response response = await get(myUrl).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200) {
        // do something
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
      return false;
    } on SocketException catch (e) {
      print('Socket Error: $e');
      return false;
    } on Error catch (e) {
      print('General Error: $e');
      return false;
    }
  }
}
