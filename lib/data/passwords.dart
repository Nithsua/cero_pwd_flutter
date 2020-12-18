import 'package:cero_pwd/services/network.dart';
import 'package:flutter/material.dart';

class ApiData {
  List<Password> _passwordsList;

  ApiData() {
    _passwordsList = [];
  }

  ApiData.fromJson(List<dynamic> jsonData) {
    _passwordsList = [];
    for (int i = 0; i < jsonData.length; i++) {
      _passwordsList.add(Password.fromJson(jsonData[i]));
    }
  }

  // Map<String, dynamic> toJson() {
  //   //TODO:Implementation of toJSON
  //   return {};
  // }

  List<Password> get getPasswordsList => _passwordsList;

  Password getPassword(int index) => _passwordsList[index];

  Future<ApiData> updatePassword(
      {@required int index, @required Password password}) async {
    String uuid = _passwordsList[index]._uuid;
    List<dynamic> jsonData = await updateAction(uuid, password.toJson());
    return ApiData.fromJson(jsonData);
  }

  Future<ApiData> deletePassword({@required int index}) async {
    String uuid = _passwordsList[index]._uuid;
    List<dynamic> jsonData = await deleteAction(uuid);
    return ApiData.fromJson(jsonData);
  }

  Future<ApiData> refreshPassword() async {
    List<dynamic> jsonData = await selectAction();
    return ApiData.fromJson(jsonData);
  }

  void createPassword() {}
}

class Password {
  String _uuid;
  String _name;
  String _url;
  String _username;
  String _password;

  Password(this._uuid, this._name, this._url, this._username, this._password);

  Password.fromJson(Map<String, dynamic> jsonData) {
    _uuid = jsonData["uuid"];
    _name = jsonData["name"];
    _url = jsonData["url"];
    _username = jsonData["username"];
    _password = jsonData["password"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> tempMap = {
      "uuid": _uuid,
      "name": _name,
      "url": _url,
      "username": _username,
      "password": _password,
    };
    return tempMap;
  }

  String get getUUID => _uuid;
  String get getName => _name;
  String get getURL => _url;
  String get getUsername => _username;
  String get getPassword => _password;

  set setUUID(String uuid) => _uuid;
  set setName(String name) => _name;
  set setURL(String url) => _url;
  set setUsername(String username) => _username;
  set setPassword(String password) => _password;
}
