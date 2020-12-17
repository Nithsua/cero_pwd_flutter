import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> selectAction() async {
  http.Response response = await http
      .get("http://192.168.31.3:8000/password_collection?action=select");
  String data = response.body;
  print(data);
  List<dynamic> jsonData = jsonDecode(data);
  return jsonData;
}
