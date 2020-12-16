class ApiData {
  List<Password> _passwordsList;

  ApiData() {
    _passwordsList = [];
  }

  ApiData.fromJson(String jsonData) {
    //TODO:Implementation of fromJSON
  }

  String toJson() {
    //TODO:Implementation of toJSON
    return "";
  }

  List<Password> get getPasswordsList => _passwordsList;

  void updatePassword({int index, Password password}) {}

  void deletePassword({int index}) {}

  void refreshPassword() {}

  void createPassword() {}
}

class Password {
  int _id;
  String _name;
  String _url;
  String _username;
  String _password;

  Password(this._id, this._name, this._url, this._username, this._password);

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
