import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AppDatabase.dart';
import '../QuestionAnswerEntity.dart';

String levelDetail='';
var appBarTitle ="some text";
class FirstHardLevel extends StatelessWidget {
  const FirstHardLevel({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    getStringFromSF();
    getDetailIntoDB();

    return FormDesign();
     /* Scaffold(
      appBar: AppBar(title:Text("Level 6"),
          titleTextStyle: TextStyle(color: Colors.white,
              fontSize: 24.0),
          backgroundColor: Color(0xFF4a39b3)),
      body:  Container(
        child:  const  FormDesign(),
      ),

    );*/



  }
}


Future<void> selectDetailIntoDB() async {
  final database = await $FloorAppDatabase.databaseBuilder('AppDatabase.db').build();

  final personDao = database.userDAO;
  //final person = QuestionAnswerEntity(Question :QuesionText,optionFirst: option1,optionSecond: option2,optionThird: option3,optionFour: option4,answer:answer);

  //int noteId =  await personDao.insertQuestionAnswer(person);
  // print('Insert $noteId');
  //await personDao.createWithId(person);
  QuestionAnswerEntity questionAnswerEntity = personDao.findQuestionByLevel(1) as QuestionAnswerEntity;
  print(questionAnswerEntity.Question);
  //  dynamic result = await personDao.findQuestionByLevel(1);

}

class FormDesign extends StatefulWidget {
  const FormDesign({Key? key}) : super(key: key);

  @override
  State<FormDesign> createState() => _FormDesignState();

}
String? answerDetail;
QuestionAnswerEntity? entity;

class _FormDesignState extends State<FormDesign> {



  @override
  Widget build(BuildContext context) {
    setState(() {
      appBarTitle = 'Level $levelDetail';
    });

   // QuestionAnswerEntity questionAnswerEntity =
    return Scaffold(
      appBar: AppBar(title:Text(appBarTitle),
          titleTextStyle: TextStyle(color: Colors.white,
              fontSize: 24.0),
          backgroundColor: Color(0xFF4a39b3)),

      body:  FutureBuilder(
          future: getDetailIntoDB(),
          builder: (context, snapshot) { // Here you told Flutter to use the word "snapshot".
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else
              return Column(
                children: <Widget> [
                  Text(entity?.Question?? '', style: TextStyle(
                      fontSize: 18
                  ),
                  ),
                  Divider(),

        RadioListTile(
          title: Text(entity?.optionFirst?? ''),
          value: entity?.optionFirst?? '',
          groupValue: answerDetail,
          onChanged: (value){
            setState(() {
              answerDetail = value.toString();
            });
          },
        ),

        RadioListTile(
          title: Text(entity?.optionSecond?? ''),
          value: entity?.optionSecond?? '',
          groupValue: answerDetail,
          onChanged: (value){
            setState(() {
              answerDetail = value.toString();
            });
          },
        ),

        RadioListTile(
          title: Text(entity?.optionThird?? ''),
          value: entity?.optionThird?? '',
          groupValue: answerDetail,
          onChanged: (value){
            setState(() {
              answerDetail = value.toString();
            });
          },
        ),


        RadioListTile(
          title: Text(entity?.optionFour?? ''),
          value: entity?.optionFour?? '',
          groupValue: answerDetail,
          onChanged: (value){
            setState(() {
              answerDetail = value.toString();
            });
          },
        ),

        ElevatedButton(
          child: Text("Submit"),
          onPressed: (){
            if(answerDetail == entity?.answer){
              callToast("Congratulations,You have select right answer.");
               addStringToSF();
            }else{
              callToast("Wrong answer.Please try again..");
            }
          },
      ),
       // SubmitFiveButton();

      ],
    );
          }),

    );
  }
}


 getDetailIntoDB() async {
  final database = await $FloorAppDatabase.databaseBuilder('AppDatabase.db').build();
  final personDao = database.userDAO;
 // Future<QuestionAnswerEntity?> answerDetail
  final result  = personDao.findQuestionByLevel(1);
 // QuestionAnswerEntity? questionAnswerEntity = result as QuestionAnswerEntity?;
 // print(questionAnswerEntity?.Question);


  entity = await  personDao.findQuestionByLevelDetail(int.parse(levelDetail));
  print(result.first);
  print(entity?.Question);
  //return questionAnswerEntity;
}

class SubmitFiveButton extends StatelessWidget {
  const SubmitFiveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      if(answerDetail == "" ){
        callToast("Congratulations,You have select right answer.");
        // saveDataInPreference();
        // addStringToSF();
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

addStringToSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //String level = int.parse(levelDetail)+1;
  prefs.setString('HARDLEVEL','$levelDetail');
}


getStringFromSF() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //String? stringValue = prefs.getString('LEVEL');
  String intValue = await prefs.getString('HARDLEVEL') ?? '1';
  String stringValue = await prefs.getString('HARDLEVEL') ?? '0';
  if(stringValue== 0){
    levelDetail = '1';
  }else{
    levelDetail = stringValue;
  }
 // return stringValue;
}



