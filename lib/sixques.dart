import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SixQuetion extends StatelessWidget {
  const SixQuetion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Level 6"),
          titleTextStyle: TextStyle(color: Colors.white,
          fontSize: 24.0),
          backgroundColor: Color(0xFF4a39b3)),
      body:  Container(
        child:  const SixQues(),
      ),

    );
  }
}

class SixQues extends StatefulWidget {
  const SixQues({Key? key}) : super(key: key);

  @override
  State<SixQues> createState() => _SixQuesState();
}

class _SixQuesState extends State<SixQues> {
  //String SelectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(15.0),
          child:  Text(" Q .India got freedom on which date?",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        QuesFiveDetail(),
        SubmitFiveButton()
      ],
    );
  }
}
enum optionDetailFourth { option1, option2,option3,option4 }
String SelectedOptionForth="";

class QuesFiveDetail extends StatefulWidget {
  const QuesFiveDetail({super.key});

  @override
  State<QuesFiveDetail> createState() => _QuesFiveDetailState();
}

class _QuesFiveDetailState extends State<QuesFiveDetail> {
  optionDetailFourth? _character = optionDetailFourth.option1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('August 15, 1946'),
          leading: Radio<optionDetailFourth>(
            value: optionDetailFourth.option1,
            groupValue: _character,
            onChanged: (optionDetailFourth? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('August 14, 1947'),
          leading: Radio<optionDetailFourth>(
            value: optionDetailFourth.option2,
            groupValue: _character,
            onChanged: (optionDetailFourth? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('August 15, 1947'),
          leading: Radio<optionDetailFourth>(
            value: optionDetailFourth.option3,
            groupValue: _character,
            onChanged: (optionDetailFourth? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('August 15, 1948'),
          leading: Radio<optionDetailFourth>(
            value: optionDetailFourth.option4,
            groupValue: _character,
            onChanged: (optionDetailFourth? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = value as String;
              });
            },
          ),
        ),
      ],
    );
  }
}

class SubmitFiveButton extends StatelessWidget {
  const SubmitFiveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      if(SelectedOptionForth == "option3" ){
        callToast("Congratulations,You have select right answer.");
       // saveDataInPreference();
        addStringToSF();

        // FourthQues();
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
//void saveDataInPreference() {
  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('LEVEL', "6");
  }
//}

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

