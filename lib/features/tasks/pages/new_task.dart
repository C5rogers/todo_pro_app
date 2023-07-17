import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_pro/config/constants/assets.dart';
import 'package:todo_app_pro/config/constants/ui.dart';
import 'package:todo_app_pro/features/shared/database/data/provider/database.dart';
import 'package:todo_app_pro/features/shared/database/utils/database_injector.dart';
import 'package:todo_app_pro/features/shared/other/util/data/date_helpers.dart';
import 'package:todo_app_pro/features/shared/other/util/ui/date_picker.dart';
import 'package:todo_app_pro/features/shared/other/util/ui/navigator.dart';
import 'package:todo_app_pro/features/shared/other/widgets/box_text_field.dart';
import 'package:todo_app_pro/features/tasks/widgets/chip.dart';

import 'package:drift/drift.dart' as drift;

final _database = getIt.get<TodoProDatabase>();

void showSnackBar(
  BuildContext context, {
  required String title,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

class NewTaskForm extends StatefulWidget {
  final Task? task;
  final bool editMode;
  const NewTaskForm({Key? key, this.editMode = false, this.task})
      : super(key: key);

  @override
  _NewTaskFormState createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TaskStatus? _status = TaskStatus.ongoing;
  TaskPriority? _priority = TaskPriority.medium;
  Category? _category;
  DateTime? _duedate;
  int? _categoryId;

  @override
  void initState() {
    super.initState();

    if (widget.editMode) {
      Task? task = widget.task;

      _status = task?.status;
      _priority = task?.priority;
      _duedate = task?.due_date;
      _content = TextEditingController(text: task?.content);
      _title = TextEditingController(text: task?.title);
      setCategory();
    }
  }

  Future setCategory() async {
    _category =
        await _database.categoriesDao.getcategoryById(widget.task!.category);
  }

  Future addTask() async {
    if (widget.editMode) {
      _database.tasksDao.updateTask(TasksCompanion(
          updated_at: drift.Value(DateTime.now()),
          id: drift.Value(widget.task!.id),
          title: drift.Value(_title.text),
          content: drift.Value(_content.text),
          category: drift.Value(_category!.id),
          due_date: drift.Value(_duedate!),
          status: drift.Value(_status ?? TaskStatus.ongoing),
          priority: drift.Value(_priority!)));
    } else {
      _database.tasksDao.addTask(TasksCompanion.insert(
          title: _title.text,
          content: _content.text,
          category: _category!.id,
          due_date: _duedate!,
          status: _status ?? TaskStatus.ongoing,
          priority: _priority!));
    }

    popRoute(context);
    showSnackBar(context, title: "Task Saved");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            iconSize: 30,
            color: UiConstants.accentColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(CupertinoIcons.chevron_left)),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0.5,
        title: Text(tr("new_task"),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: UiConstants.accentColor)),
      ),
      body: SingleChildScrollView(
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Image.asset(
                      ImageAssets.logo,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BoxTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "field is required";
                      }
                      return null;
                    },
                    controller: _title,
                    label: "Title",
                    hint: "Task title",
                  ),
                  BoxTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "field is required";
                      }
                      return null;
                    },
                    controller: _content,
                    label: "Content",
                    isMulti: true,
                    hint: "Write your task description here ",
                  ),
                  BoxTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "field is required";
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () async {
                      await datePicker(context,
                          firstDate: DateTime.now(),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 1),
                          onpicked: (date) {
                        setState(() {
                          _duedate = date;
                        });
                      });
                    },
                    controller: TextEditingController(
                        text: _duedate == null
                            ? null
                            : beautifiedDate(_duedate!)),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    label: "Due Date",
                    hint: "Tap to enter",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Category"),
                  StreamBuilder(
                    stream: _database.categoriesDao.activeCategories(),
                    builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                      final result = snapshot.data ?? [];
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: result
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ChipWidget(
                                        active: e == _category,
                                        onTap: () {
                                          setState(() {
                                            _category = e;
                                          });
                                        },
                                        title: e.name,
                                      ),
                                    ))
                                .toList()),
                      );
                    },
                  ),
                  const Text("Priority"),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: TaskPriority.values
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChipWidget(
                                  active: e == _priority,
                                  onTap: () {
                                    setState(() {
                                      _priority = e;
                                    });
                                  },
                                  title: e.name,
                                ),
                              ))
                          .toList()),
                  const SizedBox(
                    height: 50,
                  ),
                  SafeArea(
                    minimum: const EdgeInsets.only(bottom: 50),
                    child: Center(
                      child: CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          color: UiConstants.primaryColor,
                          child: Text(tr("save")),
                          onPressed: () async {
                            if (_globalKey.currentState!.validate()) {
                              if (_category == null) {
                                showSnackBar(context,
                                    title: "Please choose a category");
                              } else {
                                await addTask();
                              }
                            }
                          }),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
