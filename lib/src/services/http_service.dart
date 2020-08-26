import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:education_app/src/models/student.dart';
import 'package:education_app/src/models/user.dart';
import 'package:http/http.dart';

class HttpService {
  final String myUrl = "http://api.elite2com.com:3000/";

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
          "api/ViewGetElevesParParents?filter[where][IdParent]=$parentId";
      Response res = await get(urlEnfants);
      if (res.statusCode == 200) {
        // Successfull get request
        List<dynamic> body = jsonDecode(res.body);
        List<Student> students = body
            .map(
              (dynamic item) => Student.fromJson(item),
            )
            .toList();
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
