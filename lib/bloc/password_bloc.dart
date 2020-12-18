import 'package:bloc/bloc.dart';
import 'package:cero_pwd/data/passwords.dart';
import 'package:flutter/material.dart';

abstract class PasswordsEvent {}

class CreateEvent extends PasswordsEvent {}

class SelectEvent extends PasswordsEvent {}

class DeleteEvent extends PasswordsEvent {
  int index;

  DeleteEvent({@required this.index});
}

class ModifyEvent extends PasswordsEvent {}

class PasswordBloc extends Bloc<PasswordsEvent, ApiData> {
  PasswordBloc(List<dynamic> jsonData) : super(ApiData.fromJson(jsonData));

  @override
  Stream<ApiData> mapEventToState(PasswordsEvent event, {int id}) async* {
    if (event is CreateEvent) {
    } else if (event is SelectEvent) {
      yield await state.refreshPassword();
    } else if (event is ModifyEvent) {
    } else if (event is DeleteEvent) {
      yield await state.deletePassword(index: event.index);
    }
  }
}
