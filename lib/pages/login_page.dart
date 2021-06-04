import 'package:flutter/material.dart';
import 'package:taskdb_ui2/model/user_model.dart';
import 'package:taskdb_ui2/pages/home_page.dart';
import 'package:taskdb_ui2/pages/signup_page.dart';
import 'package:taskdb_ui2/services/db_service.dart';

class LoginPage extends StatefulWidget {
  static final String id = 'login_page';

  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin() async {
    String email = emailController.text.toString().trim();
    var user_inbox = HiveDB().loadUser();

    if (email == user_inbox.email) {
      Navigator.pushReplacementNamed(context, HomePage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,7,127,123),
      body: SafeArea(
        child: Column(
          children: [
            // head
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // user image
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/account_image.jpg'),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  // welcome text
                  Text('Welcome', style: TextStyle(color: Colors.teal[300]),),

                  SizedBox(height: 10,),

                  // welcome text
                  Text('Sign in', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                ],
              ),
            ),

            // body
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: ListView(
                  primary: false,
                  children: [
                    SizedBox(height: 60,),

                    // email textfield
                    Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),

                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter email',
                        hintStyle: TextStyle(color: Colors.grey[350]),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[350]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[350]),
                        ),
                      ),
                    ),

                    SizedBox(height: 40,),

                    // password textfield
                    Text('Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),

                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        hintStyle: TextStyle(color: Colors.grey[350]),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[350]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[350]),
                        ),
                      ),
                    ),

                    SizedBox(height:30,),

                    // text forgot password?
                    Center(
                      child: Text('Forget Password ?', style: TextStyle(color: Colors.grey[350]),),
                    ),

                    SizedBox(height:30,),

                    // button : sign in
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255,7,127,123)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              )
                          )
                      ),
                      child: Text('Sign In', style: TextStyle(color: Colors.white),),
                      onPressed: _doLogin,
                    ),

                    SizedBox(height:20,),

                    // text : or
                    Center(
                      child: Text('OR', style: TextStyle(color: Colors.grey[350]),),
                    ),

                    SizedBox(height:40,),

                    // iconbuttons : facebook | twitter || instagram
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // iconbutton : facebook
                        Container(
                          height: 30,
                          width: 30,
                          child: Image(image: AssetImage('assets/icons/facebook_icon.png'),),
                        ),

                        // iconbutton : twitter
                        Container(
                          height: 30,
                          width: 30,
                          child: Image(image: AssetImage('assets/icons/twitter_icon.png'),),
                        ),

                        // iconbutton : instagram
                        Container(
                          height: 30,
                          width: 30,
                          child: Image(image: AssetImage('assets/icons/instagram_icon.png'),),
                        ),
                      ],
                    ),

                    SizedBox(height:60,),

                    // gesture detector : text
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ? ', style: TextStyle(color: Colors.grey[350]),),

                          Text('Sign Up', style: TextStyle(color: Colors.blue),),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, SignupPage.id);
                      },
                    ),

                    SizedBox(height:20,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}