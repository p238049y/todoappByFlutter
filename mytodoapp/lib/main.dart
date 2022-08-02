import 'package:flutter/material.dart';
import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';
import 'package:mytodoapp/Views/TodoList/TodoDetailPage.dart';
import 'package:mytodoapp/Views/TodoList/TodoListPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TodoListPage(),
        '/todoAdd': (context) => TodoAddPage(),
        '/todoDetail': (context) => TodoDetailPage(),
      },
    );
  }
}