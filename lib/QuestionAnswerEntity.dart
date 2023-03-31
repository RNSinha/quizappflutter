import 'package:floor/floor.dart';

@Entity(tableName: 'table_user')
class QuestionAnswerEntity{

  @PrimaryKey(autoGenerate: true)
   final int? level;

   final String Question;

   final String optionFirst;

   final String optionSecond;

   final String optionThird;

   final String optionFour;

   final String answer;

  QuestionAnswerEntity({this.level,required this.Question, required this.optionFirst,
      required this.optionSecond, required this.optionThird, required this.optionFour, required this.answer});
}