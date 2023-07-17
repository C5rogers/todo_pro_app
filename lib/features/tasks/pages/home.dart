import 'package:flutter/material.dart';
import 'package:todo_app_pro/config/constants/ui.dart';
import 'package:todo_app_pro/features/shared/database/data/provider/database.dart';
import 'package:todo_app_pro/features/shared/database/utils/database_injector.dart';
import 'package:todo_app_pro/features/shared/other/pages/setting_screen.dart';
import 'package:todo_app_pro/features/shared/other/util/ui/navigator.dart';
import 'package:todo_app_pro/features/tasks/pages/categories.dart';
import 'package:todo_app_pro/features/tasks/pages/new_task.dart';
import 'package:todo_app_pro/features/tasks/widgets/task_card.dart';

final _database = getIt.get<TodoProDatabase>();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0.5,
        actions: [
          IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CategorieScreen()));
              },
              color: UiConstants.accentColor,
              icon: const Icon(Icons.category)),
          const SizedBox(
            width: 8,
          ),
          IconButton(
              iconSize: 30,
              onPressed: () {
                navigateToScreen(context, screen: const SettingScreen());
              },
              color: UiConstants.accentColor,
              icon: const Icon(Icons.settings))
        ],
        title: Text("Todo App",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: UiConstants.accentColor)),
      ),
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          onPressed: () {
            navigateToScreen(context, screen: const NewTaskForm());
          },
          label: const Text("Create Task")),
      body: StreamBuilder(
        stream: _database.tasksDao.allTasks(),
        builder: (context, AsyncSnapshot<List<Task>> snapshot) {
          final result = snapshot.data ?? [];
          return ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) {
              final item = result[index];
              return TaskCard(task: item);
            },
          );
        },
      ),
    );
  }
}
