import 'package:flutter/material.dart';
import 'package:todo_app_pro/features/shared/database/data/provider/database.dart';
import 'package:todo_app_pro/features/shared/other/util/ui/navigator.dart';
import 'package:todo_app_pro/features/shared/other/util/ui/text_theme.dart';
import 'package:todo_app_pro/features/tasks/pages/new_task.dart';
import 'package:todo_app_pro/features/tasks/pages/task_detail.dart';
import 'package:todo_app_pro/features/tasks/utils/ui/task_utils.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: resolveStatColor(task.status.name)),
            borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          onTap: () {
            navigateToScreen(context, screen: TaskDetail(task: task));
          },
          leading: Icon(
            resolveStatIcon(task.status.name),
            size: 35,
            color: resolveStatColor(task.status.name),
          ),
          title:
              Text(task.title, style: textThemeOfContext(context).titleLarge),
          subtitle: Text(task.status.name),
          trailing: Wrap(
            children: [
              IconButton(
                  iconSize: 20,
                  onPressed: () {},
                  icon: const Icon(Icons.delete)),
              IconButton(
                  iconSize: 20,
                  onPressed: () {
                    navigateToScreen(context,
                        screen: NewTaskForm(
                          task: task,
                          editMode: true,
                        ));
                  },
                  icon: const Icon(Icons.edit))
            ],
          ),
        ));
  }
}
