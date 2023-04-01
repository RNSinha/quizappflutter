// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  QuestionAnswerDao? _userDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `table_user` (`level` INTEGER PRIMARY KEY AUTOINCREMENT, `Question` TEXT NOT NULL, `optionFirst` TEXT NOT NULL, `optionSecond` TEXT NOT NULL, `optionThird` TEXT NOT NULL, `optionFour` TEXT NOT NULL, `answer` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  QuestionAnswerDao get userDAO {
    return _userDAOInstance ??= _$QuestionAnswerDao(database, changeListener);
  }
}

class _$QuestionAnswerDao extends QuestionAnswerDao {
  _$QuestionAnswerDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _questionAnswerEntityInsertionAdapter = InsertionAdapter(
            database,
            'table_user',
            (QuestionAnswerEntity item) => <String, Object?>{
                  'level': item.level,
                  'Question': item.Question,
                  'optionFirst': item.optionFirst,
                  'optionSecond': item.optionSecond,
                  'optionThird': item.optionThird,
                  'optionFour': item.optionFour,
                  'answer': item.answer
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<QuestionAnswerEntity>
      _questionAnswerEntityInsertionAdapter;

  @override
  Stream<QuestionAnswerEntity?> findQuestionByLevel(int level) {
    return _queryAdapter.queryStream(
        'SELECT * FROM table_user WHERE level = ?1',
        mapper: (Map<String, Object?> row) => QuestionAnswerEntity(
            level: row['level'] as int?,
            Question: row['Question'] as String,
            optionFirst: row['optionFirst'] as String,
            optionSecond: row['optionSecond'] as String,
            optionThird: row['optionThird'] as String,
            optionFour: row['optionFour'] as String,
            answer: row['answer'] as String),
        arguments: [level],
        queryableName: 'table_user',
        isView: false);
  }

  @override
  Future<QuestionAnswerEntity?> findQuestionByLevelDetail(int level) async {
    return _queryAdapter.query('SELECT * FROM table_user WHERE level = ?1',
        mapper: (Map<String, Object?> row) => QuestionAnswerEntity(
            level: row['level'] as int?,
            Question: row['Question'] as String,
            optionFirst: row['optionFirst'] as String,
            optionSecond: row['optionSecond'] as String,
            optionThird: row['optionThird'] as String,
            optionFour: row['optionFour'] as String,
            answer: row['answer'] as String),
        arguments: [level]);
  }

  @override
  Future<int> insertQuestionAnswer(QuestionAnswerEntity questionAnswerEntity) {
    return _questionAnswerEntityInsertionAdapter.insertAndReturnId(
        questionAnswerEntity, OnConflictStrategy.abort);
  }
}
