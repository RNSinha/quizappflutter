import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'AppDatabase.dart';
//import 'QuestionAnswerDao.dart';
//import 'QuestionAnswerDao.dart';
//import 'QuestionAnswerDao.dart';
//import 'QuestionAnswerDao.dart';
import 'QuestionAnswerDao.dart';
import 'QuestionAnswerEntity.dart';


class InsertDetailDatabase extends StatelessWidget {
  const InsertDetailDatabase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createInsertDetail();
  }
}


class createInsertDetail extends StatefulWidget {
  const createInsertDetail({Key? key}) : super(key: key);

  @override
  State<createInsertDetail> createState() => _createInsertDetailState();
}
String QuesionText = '';
String option1 = '';
String option2 = '';
String option3 = '';
String option4 = '';
String answer = '';

TextEditingController _QuesionTextcontroller = new TextEditingController();

class _createInsertDetailState extends State<createInsertDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Insert Detail"
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children:<Widget> [

            Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Question Detail"),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                      controller : _QuesionTextcontroller,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10.0),
                         ),
                         filled: true,
                         hintStyle: TextStyle(
                           color: Colors.grey),
                          hintText: "Enter Question detail",
                          fillColor: Colors.white,
                         ),
                       onChanged: (value) {
                         QuesionText = value;
                       },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Option 1"),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          option1 = value;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Option 2"),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          option2 = value;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),


            Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Option 3"),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          option3 = value;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),


            Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Option 4"),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          option4 = value;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),


            Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Answer"),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          answer = value;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Center(
              child:  startButton(flags: 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class startButton extends StatelessWidget {
  startButton({Key? key, required this.flags}) : super(key: key);

  final String flags;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(15),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(onPressed: () {
          // checkForLevel(context);
          checkMandatoryField();
         // insertDetailIntoDB();
          print('Enter $QuesionText') ;
        }, style: ElevatedButton.styleFrom(primary: Color(0xFF4a39b3)),
          child: Padding(padding: EdgeInsets.all(15.0),
              child: Text(flags,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),
              )
          ),
        ),
      ),
    );
  }
}

void checkMandatoryField() {
    if(QuesionText == ''){
      callToast("Please enter Question detail...?");
      return;
    }
    if(option1 == ''){
      callToast("Please enter Option1?");
      return;
    }
    if(option2 == ''){
      callToast("Please enter Option2?");
      return;
    }
    if(option3 == ''){
      callToast("Please enter Option3?");
      return;
    }
    if(option4 == ''){
      callToast("Please enter Option4?");
      return;
    }
    if(answer == ''){
      callToast("Please enter Answer...?");
      return;
    }
    insertDetailIntoDB();
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



Future<void> insertDetailIntoDB() async {
    final database = await $FloorAppDatabase.databaseBuilder('AppDatabase.db').build();

    final personDao = database.userDAO;
    final person = QuestionAnswerEntity(Question :QuesionText,optionFirst: option1,optionSecond: option2,optionThird: option3,optionFour: option4,answer:answer);

    int noteId =  await personDao.insertQuestionAnswer(person);
    print('Insert $noteId');
    //await personDao.createWithId(person);


  //  dynamic result = await personDao.findQuestionByLevel(1);
  clearField();
}

void clearField() {
  _QuesionTextcontroller.clear();
}


