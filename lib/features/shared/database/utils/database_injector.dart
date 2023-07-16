import 'package:get_it/get_it.dart';
import 'package:todo_app_pro/features/shared/database/data/provider/database.dart';

final getIt = GetIt.instance;

void setupDatabase() {
  getIt.registerSingleton<TodoProDatabase>(TodoProDatabase());
}
