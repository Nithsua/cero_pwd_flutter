import 'package:cero_pwd/bloc/password_bloc.dart';
import 'package:cero_pwd/data/passwords.dart';
import 'package:cero_pwd/services/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.black,
          ),
          scaffoldBackgroundColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.settings_outlined,
              size: 27.0,
              color: Colors.grey[400],
            ),
            onPressed: () {},
          ),
          title: Text(
            "Cero",
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add_circle_outline_rounded,
                size: 27.0,
                color: Colors.grey[400],
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
            future: selectAction(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return BlocProvider(
                  create: (context) => PasswordBloc(snapshot.data),
                  child: BlocBuilder<PasswordBloc, ApiData>(
                      builder: (context, state) {
                    return ListView.builder(
                        itemCount: state.getPasswordsList.length,
                        itemBuilder: (context, position) {
                          Password tempPassword =
                              state.getPasswordsList[position];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 3.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.apps,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              title: Text(
                                tempPassword.getName,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              subtitle: Text(
                                tempPassword.getUsername,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.copy_outlined,
                                  color: Colors.grey[700],
                                  size: 31.0,
                                ),
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                      text: tempPassword.getPassword));
                                },
                              ),
                            ),
                          );
                        });
                  }),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
// child: FutureBuilder<List<dynamic>>(
//   future: fetchTheData(),
//   builder: (BuildContext context, AsyncSnapshot snapshot) {
//     if (snapshot.connectionState == ConnectionState.done &&
//         snapshot.hasData) {
//       List<dynamic> data = snapshot.data;
//       return ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, position) {
//           var listTileData = data[position];
//           return Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 8.0, vertical: 3.0),
//             child: ListTile(
//               leading: Icon(
//                 Icons.apps,
//                 color: Colors.white,
//                 size: 35.0,
//               ),
//               title: Text(
//                 listTileData["name"],
//                 style: TextStyle(
//                   color: Colors.grey[400],
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17.0,
//                 ),
//               ),
//               subtitle: Text(
//                 listTileData["username"],
//                 style: TextStyle(
//                   color: Colors.grey[700],
//                 ),
//               ),
//               trailing: IconButton(
//                 icon: Icon(
//                   Icons.copy_outlined,
//                   color: Colors.grey[700],
//                   size: 31.0,
//                 ),
//                 onPressed: () {
//                   Clipboard.setData(
//                       ClipboardData(text: listTileData["password"]));
//                 },
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//   },
// ),
