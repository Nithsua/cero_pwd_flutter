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

Future<List<dynamic>> deleteAction(String uuid) async {
  http.Response response = await http.get(URL + "?action=delete&uuid=$uuid");
  String data = response.body;
  print(data);
  List<dynamic> jsonData = jsonDecode(data);
  return jsonData;
}

Future<List<dynamic>> updateAction(
    String uuid, Map<String, dynamic> json) async {
  print(json);
  http.Response response =
      await http.post(URL + "?action=modify", body: jsonEncode(json));
  String data = response.body;
  print(data);
  List<dynamic> jsonData = jsonDecode(data);
  return jsonData;
}

Future<List<dynamic>> createAction(Map<String, dynamic> json) async {
  print(json);
  json.remove('uuid');
  http.Response response =
      await http.post(URL + "?action=create", body: jsonEncode(json));
  String data = response.body;
  print(data);
  List<dynamic> jsonData = jsonDecode(data);
  return jsonData;
}
