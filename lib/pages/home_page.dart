import 'package:flutter/material.dart';
import 'package:taskdb_ui2/services/db_service.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String load_email() {
    var user_inbox = HiveDB().loadUser();
    String email_inbox = user_inbox.email.toString();

    return email_inbox;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Email address : ${load_email()}'),
      ),
    );
  }
}
