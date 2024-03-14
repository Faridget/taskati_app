import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/widgets/costom_btn.dart';


String? path;
String name =''; 

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      appBar:AppBar(
        actions: [
          TextButton(onPressed: (){
            if(path != null && name.isNotEmpty){
              print('done');
            }
            else if(path == null && name.isNotEmpty)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.red,
                  content: const Text('Please Enter your name and Photos')),
              );
             
            }
            else if(path != null && name.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                backgroundColor: AppColors.red,
                content: const Text('Please Enter your name')),
              );
             
            }
            else{

            }
          }, child:  Text('Done',style: TextStyle(fontSize: 18,color: AppColors.primary,),)),
        ],
      ),
      body:    Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CircleAvatar(
                radius: 70,
                backgroundImage:(path!=null)?FileImage(File(path!)) as ImageProvider :const AssetImage('assets/images/user.png'),            
              ),
              const Gap(10),
              custombtn(text: 'Upload From Camra', onPressed: () { 
                uploadFromCamra();
               }, width: 250,),
                const Gap(10),
                custombtn(text: 'Upload From Gallery', onPressed: () {
                  uploadFromGalley();
                  }, width: 250,),
                const Gap(10),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                const Gap(10),
                TextFormField(
                  onChanged: (value) {
                    name =value;
                  },
                  decoration: const InputDecoration(hintText: 'Enter Your Name'),
                ),
                 
            ],
          ),
        ),
      ),
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



