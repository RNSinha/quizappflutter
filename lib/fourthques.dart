import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourthQuetion extends StatelessWidget {
  const FourthQuetion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Level 4"),
          titleTextStyle: TextStyle(color: Colors.white,
          fontSize: 24.0),
          backgroundColor: Color(0xFF4a39b3)),
      body:  Container(
        child:  const FourthQues(),
      ),

    );
  }
}

class FourthQues extends StatefulWidget {
  const FourthQues({Key? key}) : super(key: key);

  @override
  State<FourthQues> createState() => _FourthQuesState();
}

class _FourthQuesState extends State<FourthQues> {
  //String SelectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Padding(padding: EdgeInsets.all(15.0),
          child:  Text(" Q . Muslim league was established in?",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        QuesFourthDetail(),
        SubmitFourtghButton()
      ],
    );
  }
}
enum optionDetailFourth { option1,option2,option3,option4 }
String SelectedOptionForth="";

class QuesFourthDetail extends StatefulWidget {
  const QuesFourthDetail({super.key});

  @override
  State<QuesFourthDetail> createState() => _QuesFourthDetailState();
}

class _QuesFourthDetailState extends State<QuesFourthDetail> {
  optionDetailFourth? _character = optionDetailFourth.option1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('1916'),
          leading: Radio<optionDetailFourth>(
            value: optionDetailFourth.option1,
            groupValue: _character,
            onChanged: (optionDetailFourth? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = optionDetailFourth.option1.name;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('1909'),
          leading: Radio<optionDetailFourth>(
            value: optionDetailFourth.option2,
            groupValue: _character,
            onChanged: (optionDetailFourth? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = optionDetailFourth.option2.name;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('1911'),
          leading: Radio<optionDetailFourth>(
            value: optionDetailFourth.option3,
            groupValue: _character,
            onChanged: (optionDetailFourth? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = optionDetailFourth.option3.name;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('1906'),
          leading: Radio<optionDetailFourth>(
            value: optionDetailFourth.option4,
            groupValue: _character,
            onChanged: (optionDetailFourth? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = optionDetailFourth.option4.name;
              });
            },
          ),
        ),
      ],
    );
  }
}

class SubmitFourtghButton extends StatelessWidget {
  const SubmitFourtghButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      if(SelectedOptionForth == "option4" ){
        callToast("Congratulations,You have select right answer.");
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

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('LEVEL', "4");
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

