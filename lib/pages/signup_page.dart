import 'package:flutter/material.dart';
import 'package:taskdb_ui2/model/user_model.dart';
import 'package:taskdb_ui2/services/db_service.dart';

class SignupPage extends StatefulWidget {
  static final String id = 'signup_page';

  const SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  void _doSignup() async {
    String email = emailController.text.toString().trim();
    String number = numberController.text.toString().trim();
    String address = addressController.text.toString().trim();

    var user = User.from(email: email, number: number, address: address);
    HiveDB().storeUser(user);

    Navigator.pop(context);
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

                    // number textfield
                    Text('Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),

                    TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        hintText: 'Enter number',
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

                    // address textfield
                    Text('Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),

                    TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: 'Enter address',
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
                      onPressed: _doSignup,
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

                    SizedBox(height:30,),

                    // gesture detector : text
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account ? ', style: TextStyle(color: Colors.grey[350]),),

                          Text('Sign In', style: TextStyle(color: Colors.blue),),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
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
