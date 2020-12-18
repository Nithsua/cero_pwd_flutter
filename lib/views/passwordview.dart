import 'package:cero_pwd/bloc/password_bloc.dart';
import 'package:cero_pwd/data/passwords.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordView extends StatelessWidget {
  final int index;
  final PasswordBloc passwordBloc;

  PasswordView({this.index, this.passwordBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordBloc, ApiData>(
      cubit: passwordBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Hero(
              tag: index,
              child: Text(
                state.getPasswordsList[index].getName,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.delete_outline_outlined),
                onPressed: () {
                  passwordBloc.add(DeleteEvent(index: index));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: Container(),
        );
      },
    );
  }
}
