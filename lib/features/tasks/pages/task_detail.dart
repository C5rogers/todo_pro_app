// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_pro/config/constants/ui.dart';
import 'package:todo_app_pro/features/shared/database/data/provider/database.dart';
import 'package:todo_app_pro/features/shared/database/utils/database_injector.dart';
import 'package:todo_app_pro/features/shared/other/util/data/date_helpers.dart';
import 'package:todo_app_pro/features/shared/other/util/ui/navigator.dart';
import 'package:todo_app_pro/features/shared/other/util/ui/text_theme.dart';
import 'package:todo_app_pro/features/tasks/pages/sub_task_form.dart';
import 'package:todo_app_pro/features/tasks/utils/ui/task_utils.dart';
import 'package:todo_app_pro/features/tasks/widgets/chip.dart';

final _database = getIt.get<TodoProDatabase>();

class TaskDetail extends StatefulWidget {
  final Task task;
  const TaskDetail({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          elevation: 0,
          onPressed: () {
            navigateToScreen(context,
                screen: SubTaskForm(
                  task: widget.task,
                ));
          },
          label: const Text("Add Subtasks")),
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
        title: Text("Task Detail",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: UiConstants.accentColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title,
                    style: textThemeOfContext(context).headlineMedium?.copyWith(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.task.content,
                    style: textThemeOfContext(context).titleMedium?.copyWith(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      ChipWidget(
                          avatar: const Icon(
                            Icons.calendar_month,
                            color: UiConstants.primaryColor,
                          ),
                          onTap: () {},
                          title: "Created on " +
                              beautifiedDate(widget.task.created_at)),
                      ChipWidget(
                          active: true,
                          avatar: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          onTap: () {},
                          title: "Due ${detailedDate(widget.task.due_date)}"),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      ChipWidget(
                          onTap: () {},
                          title: "Priority - ${widget.task.priority.name}"),
                      ChipWidget(
                          bg: resolveStatColor(widget.task.status.name),
                          avatar: Icon(
                            resolveStatIcon(widget.task.status.name),
                            color: resolveStatColor(widget.task.status.name),
                          ),
                          onTap: () {},
                          title: "Status ${widget.task.status.name}"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sub Tasks",
                    style: textThemeOfContext(context).titleLarge?.copyWith(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.red,
                  )
                ],
              ),
            ),
            StreamBuilder(
              stream: _database.subTaskDao.allsubtasks(widget.task.id),
              builder: (context, AsyncSnapshot<List<Subtask>> snapshot) {
                final result = snapshot.data ?? [];
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = result[index];
                    return ListTile(
                      leading: const Icon(Icons.category),
                      title: Text(item.content),
                    );
                  },
                  childCount: result.length,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
