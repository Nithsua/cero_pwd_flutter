import 'package:bloc/bloc.dart';
import 'package:cero_pwd/data/passwords.dart';
import 'package:flutter/material.dart';

abstract class PasswordsEvent {}

class CreateEvent extends PasswordsEvent {
  Password password;

  CreateEvent({@required this.password});
}

class SelectEvent extends PasswordsEvent {}

class DeleteEvent extends PasswordsEvent {
  int index;

  DeleteEvent({@required this.index});
}

class ModifyEvent extends PasswordsEvent {
  int index;
  Password password;

  ModifyEvent({@required this.index, @required this.password});
}

class PasswordBloc extends Bloc<PasswordsEvent, ApiData> {
  PasswordBloc(List<dynamic> jsonData) : super(ApiData.fromJson(jsonData));

  @override
  Stream<ApiData> mapEventToState(PasswordsEvent event) async* {
    if (event is CreateEvent) {
      yield await state.createPassword(password: event.password);
    } else if (event is SelectEvent) {
      yield await state.refreshPassword();
    } else if (event is ModifyEvent) {
      yield await state.updatePassword(
          index: event.index, password: event.password);
    } else if (event is DeleteEvent) {
      yield await state.deletePassword(index: event.index);
    }
  }
}
