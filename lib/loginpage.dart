import 'package:flutter/material.dart';
import 'package:inspection_app/main.dart';
import 'package:inspection_app/inspectionapp.dart';
import 'package:inspection_app/customdialogwidget.dart';

class LoginPage extends StatefulWidget {

  String _userName;
  String _pwd;
  bool _loginSuccessful;


  LoginPage() {
    _userName = "";
    _pwd = "";
    _loginSuccessful = false;
  }
  @override
  createState() => LoginPageState();
}


class LoginPageState extends State<LoginPage>{

  final _formKey = GlobalKey<FormState>();
  final _formPwd = GlobalKey<FormState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://www.handhousing.org/wp-content/uploads/Fannie-Mae-Logo.png"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userNameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        else if (value.length < 3) {
                          return "Username must be at least 3 characters long";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(color: Color.fromARGB(250, 0, 71, 119)),
                          hintText: "This is your username",
                          hintStyle: TextStyle(color: Color.fromARGB(100, 0, 71, 119)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),


            Container(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Form(
                key: _formPwd,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        else if (value.length < 3) {
                          return "Password must be at least 3 characters long";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Color.fromARGB(250, 0, 71, 119)),
                          hintText: "This is your password",
                          hintStyle: TextStyle(color: Color.fromARGB(100, 0, 71, 119)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),


            Container(
              padding: EdgeInsets.only(top: 70, left: 16, right: 16),
              child: Form(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // background color
                    primary: Color.fromARGB(250, 0, 71, 119),
                    padding: EdgeInsets.symmetric(horizontal: 160, vertical: 15),
                    textStyle: TextStyle(fontSize: 20, color: Colors.blueAccent),
                  ),
                  child: Text('Log In',
                  style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    if (_userNameController.text == "admin" && _passwordController.text == "admin") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InspectionApp()));
                    }
                    else {
                      showDialog(context: context, builder:(BuildContext context) =>
                          CustomDialogWidget("Opsss!", "Your username and password are not correct", "Okay"));
                    }
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}