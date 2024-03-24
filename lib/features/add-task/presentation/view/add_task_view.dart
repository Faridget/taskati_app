import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:AppBar(
      centerTitle: true,
      leading: IconButton(onPressed: 
      (){
          Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back_ios,color: AppColors.primary,)),
       title: Text('Add Task',style: getTitleStyle(color: AppColors.primary),),),
    body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title',style: getTitleStyle(),),
          const Gap(5) ,
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter Task Title',
            ),
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(20),
            // ],
          ),
          const Gap(10),
          Text('Note',style: getTitleStyle(),),
          const Gap(5) ,
          TextFormField(
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Enter Task Note',
            ),
          ),
          const Gap(10),
        ],
      ),
    ),
    );
  }
}