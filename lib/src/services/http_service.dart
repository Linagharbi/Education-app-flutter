import 'dart:convert';
import 'dart:io';

import 'package:education_app/src/models/user.dart';
import 'package:http/http.dart';

class HttpService {
  final String getsUrl = "http://api.elite2com.com:3000/api/Personnes";

  // GET Methods:
  Future<List<User>> getAllUsers() async {
    try {
      Response res = await get(getsUrl);
      if (res.statusCode == 200) {
        // Successfull get request
        List<dynamic> body = jsonDecode(res.body);
        List<User> users =
            body.map((dynamic item) => User.fromJson(item)).toList();
        return users;
      } else {
        return null;
      }
    } catch (e) {
      print("http_service: Error fetching all users!");
      return null;
    }
  }

  // POST Methods:
  void postSomething() {
    print("Posting Data");
  }

  // Extras
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup(getsUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print("Server Status: OK!");
        return true;
      }
    } on SocketException catch (_) {
      print("Server Status: DOWN!");
      return false;
    }
    return false;
  }
}
