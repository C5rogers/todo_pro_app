import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_pro/config/constants/ui.dart';
import 'package:todo_app_pro/features/shared/database/data/provider/database.dart';
import 'package:todo_app_pro/features/shared/database/utils/database_injector.dart';
import 'package:todo_app_pro/features/shared/other/util/ui/navigator.dart';
import 'package:todo_app_pro/features/shared/other/widgets/box_text_field.dart';

final _database = getIt.get<TodoProDatabase>();

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({Key? key}) : super(key: key);

  Future showcategoryDialog(BuildContext context) async {
    await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          final TextEditingController categoryName = TextEditingController();
          final GlobalKey<FormState> formKey = GlobalKey<FormState>();

          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('New Category'),
                  const SizedBox(height: 15),
                  BoxTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "field is required";
                      }
                      return null;
                    },
                    controller: categoryName,
                    label: "Name",
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    popRoute(context);
                  },
                  child: const Text("cancel")),
              TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _database.categoriesDao.addCategory(categoryName.text);
                      popRoute(context);
                    }
                  },
                  child: const Text("save")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          elevation: 0,
          onPressed: () {
            showcategoryDialog(context);
          },
          label: const Text("New")),
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
        title: Text("All Categories",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: UiConstants.accentColor)),
      ),
      body: StreamBuilder(
        stream: _database.categoriesDao.allCategories(),
        builder: (context, AsyncSnapshot<List<Category>> snapshot) {
          final result = snapshot.data ?? [];
          return ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) {
              final item = result[index];
              return ListTile(
                trailing: CupertinoSwitch(
                  activeColor: UiConstants.accentColor,
                  value: item.enabled,
                  onChanged: (v) {
                    _database.categoriesDao.updateStatus(item);
                  },
                ),
                leading: const Icon(Icons.category),
                title: Text(item.name),
              );
            },
          );
        },
      ),
    );
  }
}
