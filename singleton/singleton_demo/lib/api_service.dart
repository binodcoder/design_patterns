import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:singleton_demo/todo.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  Future<Todo> fetchData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
