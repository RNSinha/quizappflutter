import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FiveQuetion extends StatelessWidget {
  const FiveQuetion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Level 5"),
          titleTextStyle: TextStyle(color: Colors.white,
          fontSize: 24.0),
        backgroundColor: Color(0xFF4a39b3)),

      body:  Container(
        child:  const FiveQues(),
      ),

    );
  }
}

class FiveQues extends StatefulWidget {
  const FiveQues({Key? key}) : super(key: key);

  @override
  State<FiveQues> createState() => _FiveQuesState();
}

class _FiveQuesState extends State<FiveQues> {
  //String SelectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(15.0),
          child:  Text(" Q . Who was the congress President at its Lahora Session?",
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
          title: const Text('Mahatma Gandhi'),
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
          title: const Text('Jawahar Lai Nehru'),
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
          title: const Text('Sardar Patel'),
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
          title: const Text('Subhash Chandra Bose'),
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

class SubmitFiveButton extends StatelessWidget {
  const SubmitFiveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      if(SelectedOptionForth == "option2" ){
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
    prefs.setString('LEVEL', "5");
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

