import 'package:hive/hive.dart';
import 'package:myapp/models/task_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
class HiveConfig {
    static late Box<TaskModel> taskBox;

     static Future<void> hive() async{
          final appDirectory = await path_provider.getApplicationCacheDirectory();
          Hive.init(appDirectory.path);
          Hive.registerAdapter(TaskModelAdapter());
          taskBox = await Hive.openBox('TaskModel');
     }
}