import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_app/features/add-task/data/task_model.dart';

class AppLocalStorage{
static late Box box ;
static late Box<TaskModel> taskBox ;  

 init(){
  box= Hive.box('user');
  taskBox = Hive.box('task');

 }

 static cacheDate(key,value){
     
    box.put(key, value);
  }

   static getCachedDate(key){
     
    return box.get(key);
  }
   static cachetask(key,TaskModel value){
     
    taskBox.put(key, value);
  }
  static TaskModel?  gettask(key){
     
    return taskBox.get(key);
  }
  static  delettask(key){
     
     taskBox.delete(key);
  }
}