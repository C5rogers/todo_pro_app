// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _enabledMeta =
      const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<bool> enabled =
      GeneratedColumn<bool>('enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("enabled" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, name, enabled];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      enabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enabled'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final bool enabled;
  const Category({required this.id, required this.name, required this.enabled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['enabled'] = Variable<bool>(enabled);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      enabled: Value(enabled),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      enabled: serializer.fromJson<bool>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'enabled': serializer.toJson<bool>(enabled),
    };
  }

  Category copyWith({int? id, String? name, bool? enabled}) => Category(
        id: id ?? this.id,
        name: name ?? this.name,
        enabled: enabled ?? this.enabled,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, enabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.enabled == this.enabled);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> enabled;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.enabled = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.enabled = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? enabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (enabled != null) 'enabled': enabled,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<bool>? enabled}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  static const VerificationMeta _due_dateMeta =
      const VerificationMeta('due_date');
  @override
  late final GeneratedColumn<DateTime> due_date = GeneratedColumn<DateTime>(
      'due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<TaskStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TaskStatus>($TasksTable.$converterstatus);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumnWithTypeConverter<TaskPriority, String> priority =
      GeneratedColumn<String>('priority', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TaskPriority>($TasksTable.$converterpriority);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        content,
        category,
        due_date,
        created_at,
        updated_at,
        status,
        priority
      ];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_due_dateMeta,
          due_date.isAcceptableOrUnknown(data['due_date']!, _due_dateMeta));
    } else if (isInserting) {
      context.missing(_due_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    }
    context.handle(_statusMeta, const VerificationResult.success());
    context.handle(_priorityMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
      due_date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date'])!,
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updated_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      status: $TasksTable.$converterstatus.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      priority: $TasksTable.$converterpriority.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TaskStatus, String, String> $converterstatus =
      const EnumNameConverter<TaskStatus>(TaskStatus.values);
  static JsonTypeConverter2<TaskPriority, String, String> $converterpriority =
      const EnumNameConverter<TaskPriority>(TaskPriority.values);
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String title;
  final String content;
  final int category;
  final DateTime due_date;
  final DateTime created_at;
  final DateTime? updated_at;
  final TaskStatus status;
  final TaskPriority priority;
  const Task(
      {required this.id,
      required this.title,
      required this.content,
      required this.category,
      required this.due_date,
      required this.created_at,
      this.updated_at,
      required this.status,
      required this.priority});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['category'] = Variable<int>(category);
    map['due_date'] = Variable<DateTime>(due_date);
    map['created_at'] = Variable<DateTime>(created_at);
    if (!nullToAbsent || updated_at != null) {
      map['updated_at'] = Variable<DateTime>(updated_at);
    }
    {
      final converter = $TasksTable.$converterstatus;
      map['status'] = Variable<String>(converter.toSql(status));
    }
    {
      final converter = $TasksTable.$converterpriority;
      map['priority'] = Variable<String>(converter.toSql(priority));
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      category: Value(category),
      due_date: Value(due_date),
      created_at: Value(created_at),
      updated_at: updated_at == null && nullToAbsent
          ? const Value.absent()
          : Value(updated_at),
      status: Value(status),
      priority: Value(priority),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<int>(json['category']),
      due_date: serializer.fromJson<DateTime>(json['due_date']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      updated_at: serializer.fromJson<DateTime?>(json['updated_at']),
      status: $TasksTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
      priority: $TasksTable.$converterpriority
          .fromJson(serializer.fromJson<String>(json['priority'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<int>(category),
      'due_date': serializer.toJson<DateTime>(due_date),
      'created_at': serializer.toJson<DateTime>(created_at),
      'updated_at': serializer.toJson<DateTime?>(updated_at),
      'status': serializer
          .toJson<String>($TasksTable.$converterstatus.toJson(status)),
      'priority': serializer
          .toJson<String>($TasksTable.$converterpriority.toJson(priority)),
    };
  }

  Task copyWith(
          {int? id,
          String? title,
          String? content,
          int? category,
          DateTime? due_date,
          DateTime? created_at,
          Value<DateTime?> updated_at = const Value.absent(),
          TaskStatus? status,
          TaskPriority? priority}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        category: category ?? this.category,
        due_date: due_date ?? this.due_date,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at.present ? updated_at.value : this.updated_at,
        status: status ?? this.status,
        priority: priority ?? this.priority,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('due_date: $due_date, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('status: $status, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, category, due_date,
      created_at, updated_at, status, priority);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category &&
          other.due_date == this.due_date &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at &&
          other.status == this.status &&
          other.priority == this.priority);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int> category;
  final Value<DateTime> due_date;
  final Value<DateTime> created_at;
  final Value<DateTime?> updated_at;
  final Value<TaskStatus> status;
  final Value<TaskPriority> priority;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
    this.due_date = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    required int category,
    required DateTime due_date,
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    required TaskStatus status,
    required TaskPriority priority,
  })  : title = Value(title),
        content = Value(content),
        category = Value(category),
        due_date = Value(due_date),
        status = Value(status),
        priority = Value(priority);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? category,
    Expression<DateTime>? due_date,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<String>? status,
    Expression<String>? priority,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (category != null) 'category': category,
      if (due_date != null) 'due_date': due_date,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (status != null) 'status': status,
      if (priority != null) 'priority': priority,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<int>? category,
      Value<DateTime>? due_date,
      Value<DateTime>? created_at,
      Value<DateTime?>? updated_at,
      Value<TaskStatus>? status,
      Value<TaskPriority>? priority}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      due_date: due_date ?? this.due_date,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      status: status ?? this.status,
      priority: priority ?? this.priority,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (due_date.present) {
      map['due_date'] = Variable<DateTime>(due_date.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    if (status.present) {
      final converter = $TasksTable.$converterstatus;
      map['status'] = Variable<String>(converter.toSql(status.value));
    }
    if (priority.present) {
      final converter = $TasksTable.$converterpriority;
      map['priority'] = Variable<String>(converter.toSql(priority.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('due_date: $due_date, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('status: $status, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }
}

class $SubtasksTable extends Subtasks with TableInfo<$SubtasksTable, Subtask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubtasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<TaskStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TaskStatus>($SubtasksTable.$converterstatus);
  static const VerificationMeta _parent_taskMeta =
      const VerificationMeta('parent_task');
  @override
  late final GeneratedColumn<int> parent_task = GeneratedColumn<int>(
      'parent_task', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, content, created_at, updated_at, status, parent_task];
  @override
  String get aliasedName => _alias ?? 'subtasks';
  @override
  String get actualTableName => 'subtasks';
  @override
  VerificationContext validateIntegrity(Insertable<Subtask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('parent_task')) {
      context.handle(
          _parent_taskMeta,
          parent_task.isAcceptableOrUnknown(
              data['parent_task']!, _parent_taskMeta));
    } else if (isInserting) {
      context.missing(_parent_taskMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subtask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subtask(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updated_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      status: $SubtasksTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      parent_task: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_task'])!,
    );
  }

  @override
  $SubtasksTable createAlias(String alias) {
    return $SubtasksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TaskStatus, String, String> $converterstatus =
      const EnumNameConverter<TaskStatus>(TaskStatus.values);
}

class Subtask extends DataClass implements Insertable<Subtask> {
  final int id;
  final String content;
  final DateTime created_at;
  final DateTime? updated_at;
  final TaskStatus status;
  final int parent_task;
  const Subtask(
      {required this.id,
      required this.content,
      required this.created_at,
      this.updated_at,
      required this.status,
      required this.parent_task});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(created_at);
    if (!nullToAbsent || updated_at != null) {
      map['updated_at'] = Variable<DateTime>(updated_at);
    }
    {
      final converter = $SubtasksTable.$converterstatus;
      map['status'] = Variable<String>(converter.toSql(status));
    }
    map['parent_task'] = Variable<int>(parent_task);
    return map;
  }

  SubtasksCompanion toCompanion(bool nullToAbsent) {
    return SubtasksCompanion(
      id: Value(id),
      content: Value(content),
      created_at: Value(created_at),
      updated_at: updated_at == null && nullToAbsent
          ? const Value.absent()
          : Value(updated_at),
      status: Value(status),
      parent_task: Value(parent_task),
    );
  }

  factory Subtask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subtask(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      updated_at: serializer.fromJson<DateTime?>(json['updated_at']),
      status: $SubtasksTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
      parent_task: serializer.fromJson<int>(json['parent_task']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'created_at': serializer.toJson<DateTime>(created_at),
      'updated_at': serializer.toJson<DateTime?>(updated_at),
      'status': serializer
          .toJson<String>($SubtasksTable.$converterstatus.toJson(status)),
      'parent_task': serializer.toJson<int>(parent_task),
    };
  }

  Subtask copyWith(
          {int? id,
          String? content,
          DateTime? created_at,
          Value<DateTime?> updated_at = const Value.absent(),
          TaskStatus? status,
          int? parent_task}) =>
      Subtask(
        id: id ?? this.id,
        content: content ?? this.content,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at.present ? updated_at.value : this.updated_at,
        status: status ?? this.status,
        parent_task: parent_task ?? this.parent_task,
      );
  @override
  String toString() {
    return (StringBuffer('Subtask(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('status: $status, ')
          ..write('parent_task: $parent_task')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, content, created_at, updated_at, status, parent_task);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subtask &&
          other.id == this.id &&
          other.content == this.content &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at &&
          other.status == this.status &&
          other.parent_task == this.parent_task);
}

class SubtasksCompanion extends UpdateCompanion<Subtask> {
  final Value<int> id;
  final Value<String> content;
  final Value<DateTime> created_at;
  final Value<DateTime?> updated_at;
  final Value<TaskStatus> status;
  final Value<int> parent_task;
  const SubtasksCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.status = const Value.absent(),
    this.parent_task = const Value.absent(),
  });
  SubtasksCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    required TaskStatus status,
    required int parent_task,
  })  : content = Value(content),
        status = Value(status),
        parent_task = Value(parent_task);
  static Insertable<Subtask> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<String>? status,
    Expression<int>? parent_task,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (status != null) 'status': status,
      if (parent_task != null) 'parent_task': parent_task,
    });
  }

  SubtasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? content,
      Value<DateTime>? created_at,
      Value<DateTime?>? updated_at,
      Value<TaskStatus>? status,
      Value<int>? parent_task}) {
    return SubtasksCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      status: status ?? this.status,
      parent_task: parent_task ?? this.parent_task,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    if (status.present) {
      final converter = $SubtasksTable.$converterstatus;
      map['status'] = Variable<String>(converter.toSql(status.value));
    }
    if (parent_task.present) {
      map['parent_task'] = Variable<int>(parent_task.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubtasksCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('status: $status, ')
          ..write('parent_task: $parent_task')
          ..write(')'))
        .toString();
  }
}

abstract class _$TodoProDatabase extends GeneratedDatabase {
  _$TodoProDatabase(QueryExecutor e) : super(e);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $SubtasksTable subtasks = $SubtasksTable(this);
  late final TasksDao tasksDao = TasksDao(this as TodoProDatabase);
  late final CategoriesDao categoriesDao =
      CategoriesDao(this as TodoProDatabase);
  late final SubTaskDao subTaskDao = SubTaskDao(this as TodoProDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categories, tasks, subtasks];
}

mixin _$TasksDaoMixin on DatabaseAccessor<TodoProDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
  $TasksTable get tasks => attachedDatabase.tasks;
}
mixin _$CategoriesDaoMixin on DatabaseAccessor<TodoProDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
}
mixin _$SubTaskDaoMixin on DatabaseAccessor<TodoProDatabase> {
  $SubtasksTable get subtasks => attachedDatabase.subtasks;
}
