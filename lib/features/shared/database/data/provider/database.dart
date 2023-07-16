// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

enum TaskStatus {
  done,
  ongoing,
  cancelled,
}

enum TaskPriority { low, medium, urgent }

List<String> seed = [
  "Personal",
  "Work",
  "Errands",
  "Recurring",
  "Goals",
  "Social",
  "Hobbies",
  "Fun",
  "Home"
];

@DataClassName("Task")
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  IntColumn get category => integer().references(Categories, #id)();
  DateTimeColumn get due_date => dateTime()();
  DateTimeColumn get created_at =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updated_at => dateTime().nullable()();
  TextColumn get status => textEnum<TaskStatus>()();
  TextColumn get priority => textEnum<TaskPriority>()();
}

@DataClassName("Subtask")
class Subtasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  DateTimeColumn get created_at =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updated_at => dateTime().nullable()();
  TextColumn get status => textEnum<TaskStatus>()();
  IntColumn get parent_task => integer()();
}

// This will make drift generate a class called "Category" to represent a row in
// this table. By default, "Categorie" would have been used because it only
//strips away the trailing "s" in the table name.
@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'todo_pro.sqlite'));
    return NativeDatabase(
      file,
    );
  });
}

@DriftDatabase(
    tables: [Categories, Tasks, Subtasks],
    daos: [TasksDao, CategoriesDao, SubTaskDao])
class TodoProDatabase extends _$TodoProDatabase {
  TodoProDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        for (var i = 0; i < seed.length; i++) {
          await into(categories)
              .insert(CategoriesCompanion.insert(name: seed[i]));
        }
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // TODO
      },
    );
  }
}

// DAO

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<TodoProDatabase> with _$TasksDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  TasksDao(TodoProDatabase db) : super(db);

  // Stream<List<TodoEntry>> todosInCategory(Category category) {
  //   if (category == null) {
  //     return (select(todos)..where((t) => isNull(t.category))).watch();
  //   } else {
  //     return (select(todos)..where((t) => t.category.equals(category.id)))
  //         .watch();
  //   }

  // }

  Stream<List<Task>> allTasks() {
    return (select(tasks)).watch();
  }

  Future addTask(TasksCompanion task) async {
    await into(tasks).insert(task);
  }

  Future updateTask(TasksCompanion task) async {
    await update(tasks).replace(task);
  }
}

@DriftAccessor(tables: [Subtasks])
class SubTaskDao extends DatabaseAccessor<TodoProDatabase>
    with _$SubTaskDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  SubTaskDao(TodoProDatabase db) : super(db);

  Stream<List<Subtask>> allsubtasks(int parent_id) {
    return (select(subtasks)..where((t) => t.parent_task.equals(parent_id)))
        .watch();
  }

  Future addSubTask(SubtasksCompanion task) async {
    await into(subtasks).insert(task);
  }

  Future updateTask(SubtasksCompanion task) async {
    await update(subtasks).replace(task);
  }
}

@DriftAccessor(tables: [Categories])
class CategoriesDao extends DatabaseAccessor<TodoProDatabase>
    with _$TasksDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CategoriesDao(TodoProDatabase db) : super(db);

  Stream<List<Category>> allCategories() {
    return (select(categories)).watch();
  }

  Future addCategory(String name) async {
    await into(categories).insert(CategoriesCompanion.insert(name: name));
  }

  Future<Category> getcategoryById(int id) async {
    return (select(categories)..where((t) => t.id.equals(id))).getSingle();
  }

  Stream<List<Category>> activeCategories() {
    return (select(categories)..where((t) => t.enabled.equals(true))).watch();
  }

  Future updateStatus(
    Category category,
  ) async {
    return (update(categories)..where((t) => t.id.equals(category.id))).write(
      CategoriesCompanion(enabled: Value(!category.enabled)),
    );
  }
}
