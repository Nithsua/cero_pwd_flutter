import 'package:cero_pwd/services/network.dart';

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

  Map<String, dynamic> toJson() {
    //TODO:Implementation of toJSON
    return {};
  }

  List<Password> get getPasswordsList => _passwordsList;

  void updatePassword({int index, Password password}) {}

  void deletePassword({int index}) {}

  Future<ApiData> refreshPassword() async {
    List<dynamic> jsonData = await selectAction();
    return ApiData.fromJson(jsonData);
  }

  void createPassword() {}
}

class Password {
  int _id;
  String _name;
  String _url;
  String _username;
  String _password;

  Password(this._id, this._name, this._url, this._username, this._password);

  Password.fromJson(Map<String, dynamic> jsonData) {
    _id = int.parse(jsonData["id"]);
    _name = jsonData["name"];
    _url = jsonData["url"];
    _username = jsonData["username"];
    _password = jsonData["password"];
  }

  Map<String, dynamic> toJson() {
    //TODO:Implementation of toJSON
    return {};
  }

  int get getID => _id;
  String get getName => _name;
  String get getURL => _url;
  String get getUsername => _username;
  String get getPassword => _password;

  set setID(int id) => _id;
  set setName(String name) => _name;
  set setURL(String url) => _url;
  set setUsername(String username) => _username;
  set setPassword(String password) => _password;
}
