import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/Screens/Main/main_screen.dart';
import 'package:flutter_auth/Screens/Main/components/background.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth/Screens/Authentication/google_login.dart';
//import 'package:flutter_auth/Screens/Authentication/components/user_details.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    final GoogleSignIn _gSignIn = GoogleSignIn();

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "This is MainScreen",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
        ],
        ),
      ),
    );
  }
}