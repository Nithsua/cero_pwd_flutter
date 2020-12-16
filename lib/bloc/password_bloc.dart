import 'package:bloc/bloc.dart';
import 'package:cero_pwd/data/passwords.dart';

enum PasswordsEvent { CREATE, SELECT, UPDATE, DELETE }

class PasswordBloc extends Bloc<PasswordsEvent, ApiData> {
  PasswordBloc(List<dynamic> jsonData) : super(ApiData.fromJson(jsonData));

  @override
  Stream<ApiData> mapEventToState(PasswordsEvent event) {
    //TODO:Implement Branching for different events
    throw UnimplementedError();
  }
}
