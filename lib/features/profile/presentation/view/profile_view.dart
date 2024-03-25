import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_app/core/services/local_storage.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.dark_mode_rounded)),
      ],),
      body: 
      Center(
      child:ValueListenableBuilder(
        valueListenable:  Hive.box('user').listenable(),
        builder: (BuildContext context, dynamic value, Widget? child) {
          String path = AppLocalStorage.box.get('image')??'';
           String name = AppLocalStorage.box.get('name');
            return   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage:path.isNotEmpty? 
                FileImage(File(path)) as ImageProvider
                :const AssetImage('assets/images/user.png')),
                          
            ],
          );
        
        },
      )
    )
    
   );
}
}