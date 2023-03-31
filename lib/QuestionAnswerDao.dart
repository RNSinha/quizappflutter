import 'package:floor/floor.dart';

import 'QuestionAnswerEntity.dart';


@dao
abstract class QuestionAnswerDao{
  @insert
  Future<int> insertQuestionAnswer(QuestionAnswerEntity questionAnswerEntity);

 /* @Query('SELECT * FROM QuestionAnswerEntity WHERE level = :level')
  Future<QuestionAnswerEntity?> findQuestionByLevel(int level);*/


  /*@Query('Select answer from QuestionAnswerEntity where level = :level')
  Stream<String?> findAnsweByLevel(int level);*/

}