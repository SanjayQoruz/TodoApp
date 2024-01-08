import 'package:myapp/services/services.dart';

class DeleteTask{
     void delete(String key){
         HiveConfig.taskBox.delete(key);
     }
}