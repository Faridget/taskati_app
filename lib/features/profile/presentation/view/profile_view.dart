import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';
import 'package:taskati_app/features/profile/widegts/show_dialogs.dart';


String? path;
String name ='';
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box('user');
    var darkMode = box.get('darkMode')??false;
    return   Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        foregroundColor: AppColors.primary,
        actions: [
        IconButton(onPressed: (){
             box.put('darkMode', !darkMode);
             //darkMode = box.get('darkMode');
             setState(() {
               darkMode = box.get('darkMode');
             });
        },
         icon: Icon(
           darkMode ? Icons.sunny:Icons.dark_mode_rounded 
           ),
           ),
      ],),
      body: 
      SingleChildScrollView(
        child: Center(
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
                                backgroundColor: Theme.of(context).colorScheme.background,
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
                    style: getTitleStyle(context,color: AppColors.primary),),
                    const Spacer(),
                    InkWell(
                            onTap: () {
                              showImageDialog( context,onTapCamera:(){
                                   uploadFromGalley();
                            },);},
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor:AppColors.primary,
                              child: CircleAvatar(
                                radius: 17,
                                  backgroundColor: Theme.of(context).colorScheme.background,
                                  foregroundColor: AppColors.primary,
                                child: const Icon(Icons.edit)
                                ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              showImageDialog( context,onTapCamera:() async{
                                 await  uploadFromCamra().then((value){
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                 }, onTapGallery:() async{
                                   await uploadFromGalley().then((value){
                                      setState(() {
                                        Navigator.of(context).pop();
                                      });
                                   });
                                 }
                                 
                                 );
        
                              });
                            },
                          )
        
                  ],)
                
                ],
                          ),
              );
          
          },
        )
            ),
      )
    
   );
}


uploadFromCamra() async{
 final PickedImage=   await ImagePicker().pickImage(source: ImageSource.camera);
 if(PickedImage != null){
    setState(() {
      path =PickedImage.path;
    });
 }
}
uploadFromGalley() async{
 final PickedImage=   await ImagePicker().pickImage(source: ImageSource.gallery);
 if(PickedImage != null){
    setState(() {
      path =PickedImage.path;
    });
 }
}
}
 

