import 'dart:async';
import 'package:floor/floor.dart';
import 'QuestionAnswerDao.dart';
import 'QuestionAnswerEntity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


//part 'dbdetail/app_database.g.dart'; // the generated code will be there

part 'AppDatabase.g.dart'; // the generated code will be there

@Database(version: 1, entities: [QuestionAnswerEntity])
abstract class AppDatabase extends FloorDatabase {
  QuestionAnswerDao get userDAO;
}

/*
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'QuestionAnswerEntity.dart';
import 'QuestionAnswerdao.dart';

part 'appdatabase.g.dart';

@Database(entities: [QuestionAnswerEntity],version: 1)
abstract class appdatabase extends FloorDatabase{

  QuestionAnswerdao get personDao;

}*/
