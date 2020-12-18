import 'package:cero_pwd/bloc/password_bloc.dart';
import 'package:cero_pwd/data/passwords.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordView extends StatefulWidget {
  final int index;
  final PasswordBloc passwordBloc;

  PasswordView({this.index, this.passwordBloc});

  @override
  _PasswordViewState createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  bool isEdit = false;
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController urlEditingController = TextEditingController();
  final TextEditingController usernameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordBloc, ApiData>(
      cubit: widget.passwordBloc,
      builder: (context, state) {
        nameEditingController.text =
            state.getPasswordsList[widget.index].getName;
        urlEditingController.text = state.getPasswordsList[widget.index].getURL;
        usernameEditingController.text =
            state.getPasswordsList[widget.index].getUsername;
        passwordEditingController.text =
            state.getPasswordsList[widget.index].getPassword;
        return Scaffold(
          appBar: AppBar(
            title: Hero(
              tag: widget.index,
              child: Text(
                state.getPasswordsList[widget.index].getName,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.edit_outlined),
                  onPressed: () {
                    setState(() {
                      isEdit = !isEdit;
                    });
                  }),
              IconButton(
                icon: Icon(Icons.delete_outline_outlined),
                onPressed: () {
                  widget.passwordBloc.add(DeleteEvent(index: widget.index));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: Container(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextField(
                      isEdit: isEdit,
                      textEditingController: nameEditingController,
                    ),
                    CustomTextField(
                      isEdit: isEdit,
                      textEditingController: urlEditingController,
                    ),
                    CustomTextField(
                      isEdit: isEdit,
                      textEditingController: usernameEditingController,
                    ),
                    CustomTextField(
                      isEdit: isEdit,
                      textEditingController: passwordEditingController,
                    ),
                    isEdit
                        ? Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FlatButton(
                                      onPressed: () {
                                        nameEditingController.text = state
                                            .getPasswordsList[widget.index]
                                            .getName;
                                        urlEditingController.text = state
                                            .getPasswordsList[widget.index]
                                            .getURL;
                                        usernameEditingController.text = state
                                            .getPasswordsList[widget.index]
                                            .getUsername;
                                        passwordEditingController.text = state
                                            .getPasswordsList[widget.index]
                                            .getPassword;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.grey[400],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlatButton(
                                    color: Colors.grey[700],
                                    onPressed: () {
                                      print(nameEditingController.text);
                                      Password tempPassword = Password(
                                        state.getPasswordsList[widget.index]
                                            .getID,
                                        nameEditingController.text,
                                        urlEditingController.text,
                                        usernameEditingController.text,
                                        passwordEditingController.text,
                                      );
                                      widget.passwordBloc.add(
                                        ModifyEvent(
                                          index: widget.index,
                                          password: tempPassword,
                                        ),
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.grey[400],
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomTextField extends StatefulWidget {
  final bool isEdit;
  final TextEditingController textEditingController;

  CustomTextField(
      {@required this.isEdit, @required this.textEditingController});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 21.0),
      child: TextField(
        enabled: widget.isEdit,
        controller: widget.textEditingController,
        style: TextStyle(
          fontSize: 17.0,
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[700]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[700],
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: "Name",
          labelStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}
