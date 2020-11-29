import 'package:flutter/material.dart';
import 'package:sqlite_bloc/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todos Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        canvasColor: Colors.transparent
      ),
      home: HomePage(title: 'My Todo List',),
    );
  }
}