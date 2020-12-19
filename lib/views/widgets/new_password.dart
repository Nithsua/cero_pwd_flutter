import 'package:cero_pwd/bloc/password_bloc.dart';
import 'package:cero_pwd/data/passwords.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  final PasswordBloc passwordBloc;

  NewPassword({@required this.passwordBloc});

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController urlEditingController = TextEditingController();
  final TextEditingController usernameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Password",
          style: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
      ),
      body: Container(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  textEditingController: nameEditingController,
                  labelText: "Name",
                ),
                CustomTextField(
                  textEditingController: urlEditingController,
                  labelText: "URL",
                ),
                CustomTextField(
                  textEditingController: usernameEditingController,
                  labelText: "Username",
                ),
                CustomTextField(
                  textEditingController: passwordEditingController,
                  labelText: "Password",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: () {
                          Password tempPassword = Password(
                            "",
                            nameEditingController.text,
                            urlEditingController.text,
                            usernameEditingController.text,
                            passwordEditingController.text,
                          );
                          widget.passwordBloc
                              .add(CreateEvent(password: tempPassword));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Save",
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;

  CustomTextField(
      {@required this.textEditingController, @required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 21.0),
      child: TextField(
        controller: textEditingController,
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
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}
