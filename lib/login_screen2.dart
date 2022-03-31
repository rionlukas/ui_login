import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_login/home_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:ui_login/signup_screen.dart';

class loginScreens extends StatefulWidget {
  const loginScreens({Key? key}) : super(key: key);

  @override
  State<loginScreens> createState() => _loginScreensState();
}

class _loginScreensState extends State<loginScreens> {
  final _formKey = GlobalKey<FormState>();
  var emailController = new TextEditingController();
  var passwrodControler = new TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
        key: _formKey,
        child: Container(
          constraints: BoxConstraints.expand(),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/logo_netflix.png", width: 80, height: 80,),
          const SizedBox(height: 16,),
          SizedBox( width: 340,
            child: TextFormField(
            controller: emailController,
            decoration: new InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                focusColor: Colors.black12,
                icon: Icon(Icons.people),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                ),
                labelText: "Email",
                hintText: "netflix123@gmail.com"
            ),
          validator: (value){
              if (value!.isEmpty) {
                return "Email tidak boleh kosong";
              }
              return null;
          },
          ),
          ),
          
          const SizedBox(height: 16,),
          SizedBox( width: 340,
          child: TextFormField(
            controller: passwrodControler,
            obscureText: true,
              decoration: new InputDecoration(
              fillColor: Colors.black12,
              filled: true,
              focusColor: Colors.black12,
              icon: Icon(Icons.lock),
              labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                ),
          ),
            validator: (value){
              if (value!.isEmpty){
                return "Password salah";
              }
              return null;
            },
          ),
          ),
          const SizedBox(height: 20,),
        
          SizedBox(width: 340,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
              minimumSize: const Size.fromHeight(50),
            ),
              onPressed: () {
              setState(() {
               if (_formKey.currentState!.validate()){
                  print("email value : " + emailController.text);
                  print("password value : " + passwrodControler.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
                } else {
                 print("Lengkapi data");
                 showDialog(context: context, builder: (_) => AlertDialog(
                   title: Text('Informasi'),
                   content: Text('Silahkan Lengkapi Data Anda'),
                   actions: [
                     TextButton(child: Text("OK"),
                     onPressed: () {
                       Navigator.pop(context);
                     },
                     ),
                   ],
                 ),
                 );
               }
              }
              );
              },
              child : Text("Login")
          ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Forgot Password?', style: TextStyle(color: Colors.blue),),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Row(
              children: [  
              Expanded(child: Divider(thickness: 1, color: Colors.grey,),),
                SizedBox(width: 20,),
                Text("or", style: TextStyle(fontSize: 18),),
                SizedBox(width: 20,),
              Expanded(child: Divider(thickness: 1, color: Colors.grey,),),  
              ]
              )
         ] 
        ),
          const SizedBox(height: 20,),
          Column(
            children: [
              SignInButton(Buttons.Facebook, 
                  text: "Login with Facebook", 
                  onPressed: () {}
              ),
              const SizedBox(height: 7,),
              SignInButton(Buttons.Google,
                  text: "Login with Google",
                  onPressed: () {}
              ),
              const SizedBox(height: 40,),
              RichText(
                  text: TextSpan(
                    children: [
                  TextSpan(    
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.blueGrey)
                  ),
              TextSpan(
                text: 'Sign up',
                style: TextStyle(color: Colors.blue,
                ), 
                  recognizer: TapGestureRecognizer()
                  ..onTap = () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signupScreen()));
                  }
              ),
                  ])
              )
            ],
          )
          
    ],
    ),
        ),
        ),
    );
    
  }
}
