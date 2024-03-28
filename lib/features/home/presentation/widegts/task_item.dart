import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';
import 'package:taskati_app/features/add-task/data/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key, required this.model,
  });

 final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(top:10,),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color:model.color==0? AppColors.primary
        :model.color==1?AppColors.orange
        :model.color==2?AppColors.red:Colors.green,
        borderRadius: BorderRadius.circular(15),
       ),
     child: 
       Row(
      children:[
       Expanded(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.title,
            style: getTitleStyle(context,color: AppColors.white,fontSize: 16,),),
            const Gap(7),
              Row(
              children: [
                Icon(Icons.watch_later_outlined,color: AppColors.white),
                const Gap(10),
                Text('${model.startTime} : ${model.endTime}',style: getBodyStyle(context,color: AppColors.white,)),
              ],
            ),
            const Gap(7),
              Text(
              model.note,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getBodyStyle(context,color: AppColors.white)),
          ],
         ),
       ),
       //const Spacer(),
       Container(
        width: 0.5,
        height: 60,
        color: AppColors.white,
       ),
       const Gap(10),
         RotatedBox(
        quarterTurns: 3,
        child: Text(model.isComplte ? 'Complted' :'TODDO'
        ,style: getTitleStyle(context,color: AppColors.white,fontSize: 14,),),)
    
     ],),
    );
  }
}