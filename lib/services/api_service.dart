import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static String token = "";
  static int userId = 0;

  // LOGIN USER
  static Future<bool> login(String username, String password) async {
    var url = Uri.parse("https://dummyjson.com/auth/login");

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      token = data["token"];
      userId = data["id"];
      return true;
    }

    return false;
  }

  // GET TODOS USER
  static Future<List<dynamic>> getUserTodos() async {
    var url = Uri.parse("https://dummyjson.com/todos/user/$userId");

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data["todos"];
    }

    return [];
  }
}
