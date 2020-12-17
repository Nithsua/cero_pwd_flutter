import 'package:bloc/bloc.dart';
import 'package:cero_pwd/data/passwords.dart';

enum PasswordsEvent { create, select, update, delete }

class PasswordBloc extends Bloc<PasswordsEvent, ApiData> {
  PasswordBloc(List<dynamic> jsonData) : super(ApiData.fromJson(jsonData));

  @override
  Stream<ApiData> mapEventToState(PasswordsEvent event) async* {
    if (event == PasswordsEvent.create) {
    } else if (event == PasswordsEvent.select) {
      yield await state.refreshPassword();
    } else if (event == PasswordsEvent.update) {
    } else if (event == PasswordsEvent.delete) {}
  }
}
