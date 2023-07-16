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
import 'package:todo_app_pro/features/tasks/pages/new_task.dart';
import 'package:todo_app_pro/features/tasks/widgets/chip.dart';

import 'package:drift/drift.dart' as drift;

final _database = getIt.get<TodoProDatabase>();

class SubTaskForm extends StatefulWidget {
  final Task? task;
  final bool editMode;
  const SubTaskForm({Key? key, this.editMode = false, this.task})
      : super(key: key);

  @override
  _SubTaskFormState createState() => _SubTaskFormState();
}

class _SubTaskFormState extends State<SubTaskForm> {
  TextEditingController _content = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TaskStatus? _status = TaskStatus.ongoing;

  @override
  void initState() {
    super.initState();

    if (widget.editMode) {
      Task? task = widget.task;

      _status = task?.status;

      _content = TextEditingController(text: task?.content);
    }
  }

  Future addTask() async {
    if (widget.editMode) {
      _database.subTaskDao.updateTask(SubtasksCompanion(
        id: drift.Value(widget.task!.id),
        content: drift.Value(_content.text),
        status: drift.Value(_status ?? TaskStatus.ongoing),
      ));
    } else {
      _database.subTaskDao.addSubTask(SubtasksCompanion.insert(
        parent_task: widget.task!.id,
        content: _content.text,
        status: _status ?? TaskStatus.ongoing,
      ));
    }

    popRoute(context);
    showSnackBar(context, title: "SubTask Saved");
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
        title: Text("New Sub Task",
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
                    controller: _content,
                    label: "Content",
                    isMulti: true,
                    hint: "Write your task description here ",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SafeArea(
                    minimum: const EdgeInsets.only(bottom: 50),
                    child: Center(
                      child: CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          color: UiConstants.primaryColor,
                          child: const Text("Save"),
                          onPressed: () async {
                            if (_globalKey.currentState!.validate()) {
                              await addTask();
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
