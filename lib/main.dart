import 'package:flutter/material.dart';
import 'package:ui_login/form.dart';
import 'package:ui_login/login_screen2.dart';
import 'package:ui_login/signup_screen.dart';
import 'package:ui_login/home_screen.dart';
import 'package:ui_login/form.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homeScreen(),
  )
  );
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Discover upcoming events near you", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),),
              ],
            ),
         Container(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Column(
              children: <Widget>[
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreens()));
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(35),
                  ),
                  child: Text("Login", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),),
                ),
                SizedBox(height: 20,),
               Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                  ),
                  ),
                  child:  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => signupScreen()));
                    },
                    color: Colors.yellow,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Text("Sign Up", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                ),
                ],
            )
          ],
        ),
      ),
    ),
    );
  }
}
