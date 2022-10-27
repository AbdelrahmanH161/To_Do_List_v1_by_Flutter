import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/provider/list_provider.dart';
import 'package:flutter_to_do_list/screen/add_screen.dart';
import 'package:flutter_to_do_list/screen/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<listProvider>(
      create: ((context) => listProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDoList',
        theme: ThemeData(
          canvasColor: Colors.white,
          primarySwatch:Colors.cyan,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => Mianscreen() ,
          "/add":(context) => AddScreen() ,
        },
      ),
    );
  }
}


