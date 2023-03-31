import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/thirdques.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondQuestion extends StatelessWidget {
  const SecondQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Level 2"),
          titleTextStyle: TextStyle(color: Colors.white,
              fontSize: 24.0),
      backgroundColor: Color(0xFF4a39b3)),
      body:  Container(
        child:  const SecondQues(),
      ),

    );
  }
}

class SecondQues extends StatefulWidget {
  const SecondQues({Key? key}) : super(key: key);

  @override
  State<SecondQues> createState() => _SecondQuesState();
}

class _SecondQuesState extends State<SecondQues> {
  // String SelectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(15.0),
        child:  Text(" Q . Total Number of state in India?",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
        ),
        ),
        QuesSecondDetail(),
        SubmitSecondButton()
      ],
    );
  }
}
enum optionDetailSecond { option1, option2,option3,option4 }
String SelectedOptionSec="";

class QuesSecondDetail extends StatefulWidget {
  const QuesSecondDetail({super.key});

  @override
  State<QuesSecondDetail> createState() => _QuesSecondDetailState();
}

class _QuesSecondDetailState extends State<QuesSecondDetail> {
  optionDetailSecond? _character = optionDetailSecond.option1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('30'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option1,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionSec = optionDetailSecond.option1.name;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('29'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option2,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionSec = optionDetailSecond.option2.name;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('27'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option3,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionSec = optionDetailSecond.option3.name;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('28'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option4,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionSec = optionDetailSecond.option4.name;
              });
            },
          ),
        ),
      ],
    );
  }
}

class SubmitSecondButton extends StatelessWidget {
  const SubmitSecondButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      if(SelectedOptionSec == "option4" ){
        callToast("Congratulations,You have select right answer.");
        addStringToSF();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ThirdQuestion()), //// change login with home
        );
        // ThirdQues();
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
    prefs.setString('LEVEL', "2");
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
