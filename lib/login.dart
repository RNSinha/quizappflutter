import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/mitr_login_bg.jpg"),
            fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: loginDetail(),
      ),
    );
  }
}

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class loginDetail extends StatefulWidget {
  const loginDetail({Key? key}) : super(key: key);

  @override
  State<loginDetail> createState() => _loginDetailState();
}

class _loginDetailState extends State<loginDetail> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Container(
          child: Padding(padding: EdgeInsets.all(10),
            child:  TextField(
              controller: nameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
                labelText: 'User Name'
              ),
            ),
          ),
        ),

        Container(
          child: Padding(padding: EdgeInsets.all(10),
            child:  TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
                  labelText: 'Password'
              ),
            ),
          ),
        ),

        Container(
           child:Center(
             child: ElevatedButton(
               onPressed: (){
                 checkAllConditionForLogin();
                },
               child: Text("Submit"),
              ),
           ),
        )

      ],
    );
  }
}
void checkAllConditionForLogin() {
  debugPrint(nameController.text+"TEst");
  debugPrint(passwordController.text+"Text");
}






/*class loginDetail extends StatelessWidget {
  const loginDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       Container(
         child: Padding(padding: EdgeInsets.all(10),
           child:  TextField(

             controller: detail,
             decoration: InputDecoration(
               enabledBorder: OutlineInputBorder(
                 borderSide:
                 BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
                 borderRadius: BorderRadius.circular(50.0),
               ),
             ),
           ),
         ),
       ),


      ],
    );
  }
}*/

class createTextField extends StatefulWidget {
  createTextField(TextEditingController detail, {Key? key}) : super(key: key);
  TextEditingController detail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
    child:  TextField(

      controller: detail,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class createButton extends StatefulWidget {
  const createButton({Key? key}) : super(key: key);

  @override
  State<createButton> createState() => _createButtonState();
}

class _createButtonState extends State<createButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: (){
        checkAllConditionForLogin();
      },
      child: Text("Submit"),
      ),
    );
  }

  void checkAllConditionForLogin() {
    debugPrint(nameController.text);
    debugPrint(passwordController.text);
  }
}



