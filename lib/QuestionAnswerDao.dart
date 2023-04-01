import 'package:floor/floor.dart';

import 'QuestionAnswerEntity.dart';


@dao
abstract class QuestionAnswerDao{
  @insert
  Future<int> insertQuestionAnswer(QuestionAnswerEntity questionAnswerEntity);

  @Query('SELECT * FROM table_user WHERE level = :level')
  Stream<QuestionAnswerEntity?> findQuestionByLevel(int level);


  @Query('SELECT * FROM table_user WHERE level = :level')
  Future<QuestionAnswerEntity?> findQuestionByLevelDetail(int level);
 /* @Query('Select answer from QuestionAnswerEntity where level = :level')
  Stream<String?> findAnsweByLevel(int level);*/

}