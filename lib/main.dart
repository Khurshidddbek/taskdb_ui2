import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskdb_ui2/pages/home_page.dart';
import 'package:taskdb_ui2/pages/login_page.dart';
import 'package:taskdb_ui2/pages/signup_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('taskdb');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        SignupPage.id: (context) => SignupPage(),
      },
    );
  }
}