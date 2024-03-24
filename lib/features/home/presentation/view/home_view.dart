import 'dart:io';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';
import 'package:taskati_app/features/add-task/presentation/view/add_task_view.dart';
import 'package:taskati_app/features/home/presentation/widegts/task_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  String name ='';
  String? path;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name =AppLocalStorage.getCachedDate('name');
    path= AppLocalStorage.getCachedDate('image');
  }

   
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
         body: Padding(
           padding: const EdgeInsets.all(15),
           child: Column(
            children: [ 
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello ${name.isEmpty?'':name}',
                      style: getTitleStyle(color: AppColors.primary),),
                       Text('Have A nice Day',style: getBodyStyle(),),
                    ],
                  ),
                  const Spacer(),
                    CircleAvatar(
                    radius: 22,
                    backgroundImage:path !=null ?
                    FileImage(File(path!)) as ImageProvider 
                    : const AssetImage('assets/images/user.png'),
                  ),
                ],
              ),
              const Gap(15),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMEd().format(DateTime.now()).toString(),
                      style: getTitleStyle(),),
                       Text('Today',style: getBodyStyle(),),
                    ],
                  ),
                  const Spacer(),
                    //custombtn(text: 'Add Task', onPressed: (){}, width: 110)
                    SizedBox(
                      height: 45,
                      child: FloatingActionButton.extended(
                        onPressed: (){
                          navigatTo(context, const AddTaskView(),);
                        },
                        label: const Text('+ Add Task'),
                        extendedPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        elevation: 0,
                      ),
                    )
                ],
              ),
              const Gap(15),
              DatePicker(
                height: 100,
                width: 80,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
               // New date selected
               setState(() {
              //_selectedValue = date;
                });
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return const TaskItem();
                  },
                ),
              ),
              
                 
              
            ],
           ),
         ),
            
      ),
    );
  }
}

