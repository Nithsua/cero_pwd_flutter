import 'package:bloc/bloc.dart';
import 'package:cero_pwd/data/passwords.dart';

enum PasswordsEvent { CREATE, SELECT, UPDATE, DELETE }

class PasswordBloc extends Bloc<PasswordsEvent, ApiData> {
  PasswordBloc() : super(ApiData());

  @override
  Stream<ApiData> mapEventToState(PasswordsEvent event) {
    throw UnimplementedError();
  }
}
