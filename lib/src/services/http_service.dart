import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:education_app/src/models/student.dart';
import 'package:education_app/src/models/payment/tranche/payment_extra_tranche.dart';
import 'package:education_app/src/models/payment/tranche/payment_tranche.dart';
import 'package:education_app/src/models/user.dart';
import 'package:http/http.dart';

class HttpService {
  // Local development
  // final String myUrl = "http://192.168.1.200:3000/";
  final String myUrl = "http://api.elite2com.com:3000/";

  //--------------------------GET Methods-----------------------------------//
  // Get a list of all users
  Future<List<User>> getAllUsers() async {
    try {
      String urlPersonnes = myUrl + "api/Personnes";
      Response res = await get(urlPersonnes);
      if (res.statusCode == 200) {
        // Successful get request
        List<dynamic> body = jsonDecode(res.body);
        List<User> users = body
            .map(
              (dynamic item) => User.fromJson(item),
            )
            .toList();
        return users;
      } else {
        log("http_service: getAllUsers() => ${res.statusCode} ");
        return null;
      }
    } catch (e) {
      log("http_service: Error fetching all users!");
      return null;
    }
  }

  // Get a list of all students(children) from a parent id
  Future<List<Student>> getChildren(int parentId) async {
    try {
      String urlEnfants = myUrl +
          "api/ViewGetEleveInscris?filter[where][IdParent]=$parentId&filter[include]=InscriptionEleve&filter[include]=Bus&filter[include]=Cantine&filter[include]=Club&filter[include]=Panier&filter[include]=Retards&filter[include]=Absences&filter[include]=Avertissements&filter[include]=Blames";
      Response res = await get(urlEnfants);
      if (res.statusCode == 200) {
        // Successfull get request
        final List<Student> students = studentFromJson(res.body);
        return students;
      } else {
        log("http_service: getChildren() => ${res.statusCode} ");
        return null;
      }
    } catch (e) {
      log("http_service: Error fetching children!");
      return null;
    }
  }

  // Get a list of all payment tranches from inscription id
  Future<List<PaymentTranche>> getTranches(int inscriptionId) async {
    try {
      String urlPayment = myUrl +
          "api/Paiements?filter[where][Inscription]=$inscriptionId&filter[include]=reglementEleve";
      Response res = await get(urlPayment);
      if (res.statusCode == 200) {
        // Successful get request
        final List<PaymentTranche> tranches = paymentTrancheFromJson(res.body);
        return tranches;
      } else {
        log("http_service: getTranches() => ${res.statusCode} ");
        return null;
      }
    } catch (e) {
      log("http_service: Error fetching tranches!");
      return null;
    }
  }

  // Get a list of all extra payment tranches from extra payment id
  Future<List<PaymentExtraTranche>> getExtraTranches(int extraPaymentId) async {
    try {
      String urlExtraPayment = myUrl +
          "api/PaiementExtraDetails?filter[where][PaiementExtras]=$extraPaymentId&filter[include]=reglementEleve";
      Response res = await get(urlExtraPayment);
      if (res.statusCode == 200) {
        // Successful get request
        final List<PaymentExtraTranche> extraTranches =
            paymentExtraTrancheFromJson(res.body);
        return extraTranches;
      } else {
        log("http_service: getExtraTranches() => ${res.statusCode} ");
        return null;
      }
    } catch (e) {
      log("http_service: Error fetching extra tranches!");
      print(e);
      return null;
    }
  }

  //--------------------------POST Methods-----------------------------------//
  void postSomething() {
    log("Posting Data");
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
      log('Timeout Error: $e');
      return false;
    } on SocketException catch (e) {
      log('Socket Error: $e');
      return false;
    } on Error catch (e) {
      log('General Error: $e');
      return false;
    }
  }
}
