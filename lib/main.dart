import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/fiveques.dart';
import 'package:quizapp/login.dart';
import 'package:quizapp/secondques.dart';
import 'package:quizapp/sixques.dart';
import 'package:quizapp/thirdques.dart';
import 'fourthques.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'insertdetaildatabase.dart';
import 'medium/firstmedium.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
        appBarTheme: AppBarTheme(
         // iconTheme: IconThemeData(color: Colors.black),
          foregroundColor: Colors.white,
        )
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.jpg"),
              fit: BoxFit.cover)
      ),
    );
  }

    /*Container(
        color: Colors.white,
        child:
        FlutterLogo(size:MediaQuery.of(context).size.height)
    );*/
  //}
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Welcome To Quiz"),
      titleTextStyle: TextStyle(color: Colors.white,
      fontSize: 24.0),
      backgroundColor: Color(0xFF4a39b3)),

      body: Column(
         children: [
           Center(
            child: Padding(padding: EdgeInsets.all(20.0),
            child : Text("Welcome to Quiz...",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
              textAlign: TextAlign.start,
            ),
           ),
           ),
           Center(
             child:  startButton(flags: 'EASY'),
           ),
           Center(
             child:   startButton(flags: 'MEDIUM'),
           ),
           Center(
             child:  startButton(flags: 'HARD'),
           ),
         ],
      ),
    );
  }
}

class startButton extends StatelessWidget {
  startButton({Key? key, required this.flags}) : super( key: key);

  final String flags ;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(15),
    child: SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(onPressed: () {
        // checkForLevel(context);
        getStringValuesSF(context,flags);
      },style: ElevatedButton.styleFrom(primary: Color(0xFF4a39b3)),
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



void getStringValuesSF(BuildContext context, String flags) async {

      if(flags == "EASY") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //Return String
        //String? stringValue = prefs.getString('LEVEL');
        String intValue = await prefs.getString('LEVEL') ?? '1';
        String stringValue = await prefs.getString('LEVEL') ?? '0';

        debugPrint('$stringValue + Test $intValue');
        print('$stringValue + Test $intValue');
        // stringValue;
        if (stringValue == "0") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Home()), //// change login with home
          );
        }
        if (stringValue == "1") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (
                    context) => const SecondQuestion()), //// change login with home
          );
        }

        if (stringValue == "2") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (
                context) => const ThirdQuestion()), //// change login with home
          );
        }
        if (stringValue == "3") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (
                context) => const FourthQuetion()), //// change login with home
          );
        }
        if (stringValue == "4") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (
                context) => const FiveQuetion()), //// change login with home
          );
        }
        if (stringValue == "5") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (
                context) => const SixQuetion()), //// change login with home
          );
        }
      }
      if(flags == "MEDIUM") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //Return String
        //String? stringValue = prefs.getString('LEVEL');
        String intValue = await prefs.getString('MEDIUMLEVEL') ?? '1';
        String stringValue = await prefs.getString('MEDIUMLEVEL') ?? '0';

        debugPrint('$stringValue + Test $intValue');
        print('$stringValue + Test $intValue');
        // stringValue;
        if (stringValue == "0") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FirstMedium()), //// change login with home
          );
        }
      }
      if(flags == "HARD") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const InsertDetailDatabase()), //// change login with home
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






