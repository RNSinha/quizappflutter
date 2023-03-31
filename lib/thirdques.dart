import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fourthques.dart';


class ThirdQuestion extends StatelessWidget {
  const ThirdQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Level 3"),
          titleTextStyle: TextStyle(color: Colors.white,
              fontSize: 24.0),
      backgroundColor: Color(0xFF4a39b3)),
      body:  Container(
        child:  const ThirdQues(),
      ),

    );
  }
}

class ThirdQues extends StatefulWidget {
  const ThirdQues({Key? key}) : super(key: key);

  @override
  State<ThirdQues> createState() => _ThirdQuesState();
}

class _ThirdQuesState extends State<ThirdQues> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(15.0),
          child:  Text(" Q . National animal of India?",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        QuesThirdDetail(),
        SubmitThirdButton()
      ],
    );
  }
}

enum optionDetailThird { option1, option2,option3,option4 }
String SelectedOptionthird="";

class QuesThirdDetail extends StatefulWidget {
  const QuesThirdDetail({super.key});

  @override
  State<QuesThirdDetail> createState() => _QuesThirdDetailState();
}

class _QuesThirdDetailState extends State<QuesThirdDetail> {
  optionDetailThird? _character = optionDetailThird.option1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Lion'),
          leading: Radio<optionDetailThird>(
            value: optionDetailThird.option1,
            groupValue: _character,
            onChanged: (optionDetailThird? value) {
              setState(() {
                _character = value;
                SelectedOptionthird = optionDetailThird.option1.name;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Tiger'),
          leading: Radio<optionDetailThird>(
            value: optionDetailThird.option2,
            groupValue: _character,
            onChanged: (optionDetailThird? value) {
              setState(() {
                _character = value;
                SelectedOptionthird = optionDetailThird.option2.name;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Elephant'),
          leading: Radio<optionDetailThird>(
            value: optionDetailThird.option3,
            groupValue: _character,
            onChanged: (optionDetailThird? value) {
              setState(() {
                _character = value;
                SelectedOptionthird = optionDetailThird.option3.name;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Panther'),
          leading: Radio<optionDetailThird>(
            value: optionDetailThird.option4,
            groupValue: _character,
            onChanged: (optionDetailThird? value) {
              setState(() {
                _character = value;
                SelectedOptionthird = optionDetailThird.option4.name;
              });
            },
          ),
        ),
      ],
    );
  }
}

class SubmitThirdButton extends StatelessWidget {
  const SubmitThirdButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      if(SelectedOptionthird == "option2" ){
        callToast("Congratulations,You have select right answer.");
        addStringToSF();
       //FourthQues();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FourthQuetion()), //// change login with home
        );
      }else{
        callToast("Wrong answer.Please try again..");
      }
    }, child: Text("Submit",
    style: TextStyle(
      color: Colors.white
        ),
      )
    );
  }
}


  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('LEVEL', "3");
  }


void callToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


