import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/secondques.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Text("Level 1"),
          titleTextStyle: TextStyle(color: Colors.white,
              fontSize: 24.0),
      backgroundColor: Color(0xFF4a39b3)),
      body:  Container(
        child: firstQues(),
      ),

    );

  }
}

class firstQues extends StatefulWidget {
  const firstQues({Key? key}) : super(key: key);

  @override
  State<firstQues> createState() => _firstQuesState();
}

class _firstQuesState extends State<firstQues> {
  String SelectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0,),child:
        Text(" Q . Capital of India?",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        ),
        ),
        //QuesOneDetail(),
        MyStatefulWidget(),
        SubmitButton()
      ],
    );
  }
}


//enum SingingCharacter { lafayette, jefferson,test1, test2 }
enum optionDetailValue { mumbai,delhi, kolkata, chennai }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  optionDetailValue? _character = optionDetailValue.delhi;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Delhi'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.delhi,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;

                SelectedOption = optionDetailValue.delhi.name;
                log('data: $_character + $value + $SelectedOption');
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mumbai'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.mumbai,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = optionDetailValue.mumbai.name;
                log('data: $_character + $value + $SelectedOption');
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Kolkata'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.kolkata,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = optionDetailValue.kolkata.name;
                log('data: $_character + $value + $SelectedOption');
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Chennai'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.chennai,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = optionDetailValue.chennai.name; //optionDetailValue.values as String ;//character?.index as String;
                log('data: $_character + $value + $SelectedOption');
              });
            },
          ),
        ),
      ],
    );
  }
}

////// comment for not working code
//enum optionDetailValue { delhi, mumbai, kolkata, chennai }
String SelectedOption = "";

class QuesOneDetail extends StatefulWidget {
  const QuesOneDetail({super.key});

  @override
  State<QuesOneDetail> createState() => _QuesOneDetailState();
}

class _QuesOneDetailState extends State<QuesOneDetail> {
  optionDetailValue? _character = optionDetailValue.delhi;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Delhi'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.delhi,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mumbai'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.mumbai,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Kolkata'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.kolkata,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Chennai'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.chennai,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = value as String;
              });
            },
          ),
        ),
      ],
    );
  }
}




/*class OptionDetail extends StatefulWidget {
  const OptionDetail({Key? key}) : super(key: key);

  @override
  State<OptionDetail> createState() => _OptionDetailState();
}

class _OptionDetailState extends State<OptionDetail> {
  optionDetailValue? _character = optionDetailValue.delhi;
  String SelectedOption = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        ListTile(
          title: const Text('Delhi'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.delhi,
            groupValue: _character,
            onChanged: (optionDetailValue? value){
              setState(() {
                _character = value;
                SelectedOption = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mumbai'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.mumbai,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Kolkata'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.kolkata,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Chennai'),
          leading: Radio<optionDetailValue>(
            value: optionDetailValue.chennai,
            groupValue: _character,
            onChanged: (optionDetailValue? value) {
              setState(() {
                _character = value;
                SelectedOption = value as String;
              });
            },
          ),
        ),
      ],
    );
  }
}*/

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){

     if(SelectedOption == "delhi" ){
        callToast("Congratulations,You have select right answer.");
        addStringToSF();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondQuestion()), //// change login with home
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
    prefs.setString('LEVEL', "1");
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


class SecondQues extends StatefulWidget {
  const SecondQues({Key? key}) : super(key: key);

  @override
  State<firstQues> createState() => _SecondQuesState();
}

class _SecondQuesState extends State<firstQues> {
 // String SelectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(" Q . Total Number of state in India?"),
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
                SelectedOptionSec = value as String;
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
                SelectedOptionSec = value as String;
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
                SelectedOptionSec = value as String;
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
                SelectedOptionSec = value as String;
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
      if(SelectedOptionSec == "28" ){
        callToast("Congratulations,You have select right answer.");
        ThirdQues();
      }else{
        callToast("Wrong answer.Please try again..");
      }
    }, child: Text("Submit"));
  }
}

//////third Question code Start...
class ThirdQues extends StatefulWidget {
  const ThirdQues({Key? key}) : super(key: key);

  @override
  State<ThirdQues> createState() => _ThirdQuesState();
}

class _ThirdQuesState extends State<ThirdQues> {
 // String SelectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(" Q . National animal of India?"),
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
  optionDetailSecond? _character = optionDetailSecond.option1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Lion'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option1,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionthird = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Tiger'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option2,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionthird = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Elephant'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option3,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionthird = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Panther'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option4,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionthird = value as String;
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
      if(SelectedOptionthird == "Tiger" ){
        callToast("Congratulations,You have select right answer.");
       FourthQues();
      }else{
        callToast("Wrong answer.Please try again..");
      }
    }, child: Text("Submit"));
  }
}


//////Fourth Question code Start...
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
      children: [
        Text(" Q . Which is the largest hot desert in the world?"),
        QuesFourthDetail(),
        SubmitFourtghButton()
      ],
    );
  }
}
enum optionDetailFourth { option1, option2,option3,option4 }
String SelectedOptionForth="";

class QuesFourthDetail extends StatefulWidget {
  const QuesFourthDetail({super.key});

  @override
  State<QuesFourthDetail> createState() => _QuesFourthDetailState();
}

class _QuesFourthDetailState extends State<QuesFourthDetail> {
  optionDetailSecond? _character = optionDetailSecond.option1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Thar desert'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option1,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Sahara desert'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option2,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Namib desert'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option3,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
              setState(() {
                _character = value;
                SelectedOptionForth = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Gobi desert'),
          leading: Radio<optionDetailSecond>(
            value: optionDetailSecond.option4,
            groupValue: _character,
            onChanged: (optionDetailSecond? value) {
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

class SubmitFourtghButton extends StatelessWidget {
  const SubmitFourtghButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      if(SelectedOptionForth == "Tiger" ){
        callToast("Congratulations,You have select right answer.");
       // FourthQues();
      }else{
        callToast("Wrong answer.Please try again..");
      }
    }, child: Text("Submit"));
  }
}
