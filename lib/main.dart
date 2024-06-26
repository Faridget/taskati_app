import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/themes/themes.dart';
import 'package:taskati_app/features/add-task/data/task_model.dart';

import 'features/splash/presentation/view/splash_view.dart';

void main() async{
   await Hive.initFlutter();
   await Hive.openBox('user');
   Hive.registerAdapter(TaskModelAdapter());
   await Hive.openBox<TaskModel>('task');
   AppLocalStorage().init();
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, Box, child) {
        var darkMode = AppLocalStorage.getCachedDate('darkMode')?? false;
        return  MaterialApp(
        themeMode:darkMode? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.appLightTheme,
        darkTheme: AppTheme.appDarkTheme,
        
        debugShowCheckedModeBanner: false,
        home: const SplashViwe(),
      );
      }
       
    );
  }
}
