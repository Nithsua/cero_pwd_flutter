import 'dart:convert';

import 'package:http/http.dart' as http;

const String URL = "http://192.168.31.124:8000/password_collection";

Future<List<dynamic>> selectAction() async {
  http.Response response = await http.get(URL + "?action=select");
  String data = response.body;
  print(data);
  List<dynamic> jsonData = jsonDecode(data);
  return jsonData;
}

Future<List<dynamic>> deleteAction(int id) async {
  http.Response response = await http.get(URL + "?action=delete&id=$id");
  String data = response.body;
  print(data);
  List<dynamic> jsonData = jsonDecode(data);
  return jsonData;
}
