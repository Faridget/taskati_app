import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/widgets/costom_btn.dart';

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
          TextButton(onPressed: (){}, child:  Text('Done',style: TextStyle(fontSize: 18,color: AppColors.primary,),)),
        ],
      ),
      body:    Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/user.png'),            
              ),
              const Gap(10),
              custombtn(text: 'Upload From Camra', onPressed: () {  }, width: 250,),
                const Gap(10),
                custombtn(text: 'Upload From Gallery', onPressed: () {  }, width: 250,),
                const Gap(10),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                const Gap(10),
                TextFormField(),
                 
            ],
          ),
        ),
      ),
    );
  }
}


