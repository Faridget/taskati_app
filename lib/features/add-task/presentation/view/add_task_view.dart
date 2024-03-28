import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/functions/custom_dialogs.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';
import 'package:taskati_app/features/add-task/data/task_model.dart';
import 'package:taskati_app/features/home/presentation/view/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var date =DateFormat("yyyy-MM-dd").format(DateTime.now());
  var startTime =DateFormat("hh:mm a").format(DateTime.now());
  var endTime =DateFormat("hh:mm a").format(DateTime.now().add(const Duration(minutes: 30)));
  int color =0;
  var titleController = TextEditingController();
  var noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     
    return   Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
      centerTitle: true,
      leading: IconButton(onPressed: 
      (){
          Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back_ios,color: AppColors.primary,)),
       title: Text('Add Task',style: getTitleStyle(context,color: AppColors.primary),),),
    body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title',style: getTitleStyle(context,fontSize: 16,),),
          const Gap(5) ,
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Enter Task Title',
            ),
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(20),
            // ],
          ),
          const Gap(10),
          Text('Note',style: getTitleStyle(context,fontSize: 16,),),
          const Gap(5) ,
          TextFormField(
            controller: noteController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Enter Task Note',
            ),
          ),
          const Gap(10),
          Text('Date',style: getTitleStyle(context,fontSize: 16,),),
          const Gap(5) ,
          TextFormField(
            onTap: () {
             showDatePicker(context: context,
             builder:(context, child) {
               return Theme(data: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                primary: AppColors.white,
                onPrimary: AppColors.black,
                seedColor: AppColors.black,
                
                
                
                )
               ), child: child!);
             },
              firstDate: DateTime.now(),
               lastDate:DateTime(2050))
               .then((value) {
                if(value != null){
              setState(() {
                 date =DateFormat("yyyy-MM-dd").format(value);
                  });
                }
                
               });
            },
            readOnly: true,
            decoration:   InputDecoration(
              hintText: date,
              suffixIcon:   Icon(Icons.calendar_month,color: AppColors.primary,)
            ),
              ),
          const Gap(10),
          Row(
            children: [
              Expanded(child: Text('Start Time',style: getBodyStyle(context),)),
              const Gap(10),
              Expanded(child: Text('Start Time',style: getBodyStyle(context),)),
            ],
          ),
          const Gap(7),
           Row(
            children: [
            Expanded(child: TextFormField(
            onTap: () {
             showTimePicker(context: context,initialTime:TimeOfDay.now())
               .then((value) {
                if(value != null){
              setState(() {
                 startTime =value.format(context);
                  });
                }
                
               });
            },
            readOnly: true,
            decoration:   InputDecoration(
              hintText: startTime,
              suffixIcon:   Icon(Icons.watch_later_outlined,color: AppColors.primary,)
            ),
              ), ),
              const Gap(10),
              Expanded(child: TextFormField(
            onTap: () {
             showTimePicker(context: context,initialTime:TimeOfDay.now())
               .then((value) {
                if(value != null){
              setState(() {
                 endTime =value.format(context);
                  });
                }
                
               });
            },
            readOnly: true,
            decoration:   InputDecoration(
              hintText: endTime,
              suffixIcon:   Icon(Icons.watch_later_outlined,color: AppColors.primary,)
            ),
              ),),
            ],
          ),
          const Gap(15),
          Row(
                children: [
                   Row(
            children:  
              List.generate(3, (index) => Padding(
                padding: const EdgeInsets.all(3),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      color =index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: 
                    index == 0?AppColors.primary
                    :index==1?AppColors.orange
                    :AppColors.red,
                    child: index ==color?
                     Icon(Icons.check,
                     color : AppColors.white,)
                     :const SizedBox(),)
                  ),
                ),
              )),

                  const Spacer(),
                    //custombtn(text: 'Add Task', onPressed: (){}, width: 110)
                    SizedBox(
                      height: 45,
                      child: FloatingActionButton.extended(
                        onPressed: (){
                          if(titleController.text.isEmpty){
                        showErroDialog(context,'Enter Task Title');
                          }else if(noteController.text.isEmpty){
                            showErroDialog(context,'Enter Task Note');
                          }else{

                          var taskdate = DateTime.now().toString();
                          AppLocalStorage.cachetask(taskdate,
                          TaskModel( id:taskdate,
                           title: titleController.text,
                            note: noteController.text,
                            date: date,
                            startTime: startTime,
                            endTime: endTime,
                            color: color,
                            isComplte:false)
                            
                          );
                          
                         navigatReplace(context, const HomeView());
                        }},
                        label: const Text('Add Task'),
                        extendedPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        elevation: 0,
                      ),
                    )
                ],
              ),
           
        ],
      ),
    ),
    );
  }
}