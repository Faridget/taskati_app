import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/colors.dart';

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
      body: const Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(''),
              
               
            )
          ],
        ),
      ),
    );
  }
}
