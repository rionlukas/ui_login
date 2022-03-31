import 'package:flutter/material.dart';
import 'package:ui_login/login_screen2.dart';
import 'package:ui_login/main.dart';
import 'package:ui_login/signup_screen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo_netflix.png", width: 80, height: 80,),
              const SizedBox(height: 10,),
              const Text("NETFLIX", 
              style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black26),
              ),
              const SizedBox(height: 26,),
              const Text ("Discover upcomings event near you",
                style: 
                TextStyle(fontSize: 22, color: Colors.grey),
              ),
              const SizedBox(height: 76,),
              SizedBox(width: 340,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreens()));
                },
                child: Text("Login"),
              ),
              ),
              const SizedBox(height: 16,),
                SizedBox(width: 340,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => signupScreen()));
                    },
                    child: Text("Sign Up"),
                  ),
              ),
              TextButton(
                onPressed: (){}, 
                child: Text("Skip For Now", style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

