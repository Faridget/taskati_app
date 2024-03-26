import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primary,
        actions: [
        IconButton(onPressed: (){
          var darkMode = AppLocalStorage.getCachedDate('darkMode')??false;
            AppLocalStorage.cacheDate('darkMode', !darkMode);
        }, icon: const Icon(Icons.dark_mode_rounded)),
      ],),
      body: 
      Center(
      child:ValueListenableBuilder(
        valueListenable:  Hive.box('user').listenable(),
        builder: (BuildContext context, dynamic value, Widget? child) {
          String path = AppLocalStorage.box.get('image')??'';
           String name = AppLocalStorage.box.get('name');
            return   Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:path.isNotEmpty? 
                      FileImage(File(path)) as ImageProvider
                      :const AssetImage('assets/images/user.png')),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            
                          },
                          child: CircleAvatar(
                              backgroundColor: AppColors.white,
                              foregroundColor: AppColors.primary,
                            child: const Icon(Icons.camera_alt_rounded)),
                        ),
                      )
                  ],
                ),
                const Gap(25),
                 Divider(
                  color: AppColors.primary,
                 ),
                const Gap(25),
                Row(children: [
                  Text(name,
                  style: getTitleStyle(color: AppColors.primary),),
                  const Spacer(),
                  InkWell(
                          onTap: () {
                            
                          },
                          child: CircleAvatar(
                            radius: 19,
                            backgroundColor:AppColors.primary,
                            child: CircleAvatar(
                              radius: 17,
                                backgroundColor: AppColors.white,
                                foregroundColor: AppColors.primary,
                              child: const Icon(Icons.edit)),
                          ),
                        ),

                ],)
              
              ],
                        ),
            );
        
        },
      )
    )
    
   );
}
}