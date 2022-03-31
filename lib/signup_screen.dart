import 'package:flutter/material.dart';
import 'package:ui_login/login_screen2.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:ui_login/home_screen.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwrodControler = TextEditingController();
  var dropDown;
  var gender;
  bool checkedValue = false;
  List<String> dropDownList = ["Indonesia", "Sinagpore", "Korea", "Kenya", "Yunani", "Jerman"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            // constraints: BoxConstraints.expand(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo_netflix.png", width: 80, height: 80,),
                const SizedBox(height: 30,),
                const Text("CREATE YOUR NETFLIX",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                const SizedBox(height: 12,),
                SizedBox(width: 340, height: 40,
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      fillColor: Colors.black12,
                      filled: true,
                      focusColor: Colors.black12,
                      labelText: "Full Name",
                      hintText: "John Supriyadi",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 12,),
                SizedBox(width: 340, height: 40,
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      fillColor: Colors.black12,
                      filled: true,
                      focusColor: Colors.black12,
                      labelText: "Email",
                      hintText: "netflix123@gmail.com",
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return "Email tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 12,),
                SizedBox(width: 340, height: 40,
                  child: TextFormField(
                    controller: passwrodControler,
                    obscureText: true,
                    decoration: const InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      fillColor: Colors.black12,
                      filled: true,
                      focusColor: Colors.black12,
                      labelText: "Password",
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return "Password salah";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 12,),
                
                 Column(
                  children: [
                    ListTile(
                      leading: Radio<String>(
                        value: 'male',
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      title: const Text('Male'),
                    ),
                    ListTile(
                      leading: Radio<String>(
                        value: 'female',
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      title: const Text('Female'),
                    ),
                    SizedBox(height: 4,),
                    Column(
                    children: [ 
                      SizedBox(width: 320,
                      child: DropdownButton(
                      isExpanded: true,
                      hint: Text("Nationallity"),
                      value: dropDown,
                      onChanged: (newValue){
                        setState(() {
                          print(newValue.toString());
                          dropDown = newValue;
                        });
                      },
                      items: dropDownList.map((String value){
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                      ),
          ],
                    ),
                    SizedBox(height: 12,),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text("Saya bukan warga Bekasi",
                        style: TextStyle(fontSize: 14),
                      ),
                      value: checkedValue,
                      onChanged: (newValue){
                        setState(() {
                          checkedValue = newValue!;
                          print(newValue);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(width: 340,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()){
                            print("fullname value : " + nameController.text);
                            print("email value : " + emailController.text);
                            print("password value : " + passwrodControler.text);
                            print("gender : " + gender.toString());
                            print("nationallity : "  + dropDown.toString());
                            print("saya bukan warga bekasi : " + checkedValue.toString());
                            Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
                          } else {
                            print("Lengkapi data");
                            showDialog(context: context, builder: (_) => AlertDialog(
                              title: Text('Informasi'),
                              content: Text("Silahkan Lengkapi Data Anda"),
                              actions: [
                                TextButton(child: Text("OK"),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            );
                          }
                        });
                      },
                      child : Text("Sign Up")
                  ),
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
                        text: "Sign Up with Facebook",
                        onPressed: () {}
                    ),
                    const SizedBox(height: 12,),
                    SignInButton(Buttons.Google,
                        text: "Sign Up with Google",
                        onPressed: () {}
                    ),
                  ],
                ),
              ],
            ),

          ),
        ),
      )
    );
  }
}

