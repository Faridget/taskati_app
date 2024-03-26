import 'dart:io';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';
import 'package:taskati_app/features/add-task/data/task_model.dart';
import 'package:taskati_app/features/add-task/presentation/view/add_task_view.dart';
import 'package:taskati_app/features/home/presentation/widegts/task_item.dart';
import 'package:taskati_app/features/profile/presentation/view/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //var box = Hive.box('task');
  String name ='';
  String? path;
  String _selectedValue = DateFormat("yyyy-MM-dd").format(DateTime.now());
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
                    InkWell(
                      onTap: () {
                        navigatTo(context, const ProfileView());
                      },
                      child: CircleAvatar(
                      radius: 22,
                      backgroundImage:path !=null ?
                      FileImage(File(path!)) as ImageProvider 
                      :const AssetImage('assets/images/user.png'),
                      ),
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
              _selectedValue =  DateFormat("yyyy-MM-dd").format(date);
                });
                },
              ),
              const Gap(20),
              Expanded(
                child: ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable:  Hive.box<TaskModel>('task').listenable(),
                  builder: (context, Box<TaskModel> value,child) {
                    List<TaskModel> tasks =[];
                    for (var element in value.values) {
                      if(element.date==_selectedValue){
                        tasks.add(element);
                      }
                      
                    }
                    if(tasks.isEmpty){
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/images/empty.json',width: 250,),
                            const Text('No Tasks Today')
                          ],
                        ),
                      );

                    }
                    return  ListView.separated(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return    Dismissible(
                        key: UniqueKey(),
                        onDismissed:(direction) {
                           if(direction == DismissDirection.startToEnd)
                           {
                            AppLocalStorage.cachetask(
                              tasks[index].id,
                               TaskModel(
                                id: tasks[index].id,
                                title: tasks[index].title,
                                note: tasks[index].note,
                                date: tasks[index].date,
                                startTime: tasks[index].startTime,
                                endTime: tasks[index].endTime,
                                color: 3,
                                isComplte: true)
                                );
                           }
                           else{
                            AppLocalStorage.delettask(tasks[index].id);                          }
                        },
                        secondaryBackground: Container(
                          padding: const EdgeInsets.all(20),
                          color: AppColors.red,
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Delete',style: getBodyStyle(color:AppColors.white, )),
                              const Gap(5),
                              Icon(Icons.delete,color: AppColors.white,),
                            ],
                          ),
                        ),
                        background: Container(
                          padding:  const EdgeInsets.all(20),
                          color: Colors.green,
                          child:  Row(
                            children: [
                              Icon(Icons.check,color: AppColors.white,),
                              const Gap(5),
                               Text('Complete',style: getBodyStyle(color:AppColors.white, ),)
                            ],
                          ),
                        ),
                        child: TaskItem(
                          model: tasks[index] 
                          )
                          );
                    },
                    separatorBuilder: (context, index) => const Gap(10),
                  );
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

