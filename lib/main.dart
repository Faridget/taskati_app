import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/colors.dart';

import 'features/splash/presentation/view/splash_view.dart';

void main() async{
   await Hive.initFlutter();
    await Hive.openBox('user');
   AppLocalStorage().init();
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: AppColors.white,),
      inputDecorationTheme: InputDecorationTheme(
        constraints: const BoxConstraints(maxHeight: 60),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
      )
      ),
      
      debugShowCheckedModeBanner: false,
      home: const SplashViwe(),
    );
  }
}
