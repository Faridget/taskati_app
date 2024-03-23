import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:10,),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(15),
       ),
     child: 
       Row(
      children:[
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Task 1',
          style: getTitleStyle(color: AppColors.white,fontSize: 16,),),
          const Gap(7),
            Row(
            children: [
              Icon(Icons.watch_later_outlined,color: AppColors.white),
              const Gap(10),
              Text('12:00 AM 12:00 AM',style: getBodyStyle(color: AppColors.white,)),
            ],
          ),
          const Gap(7),
            Text('Task 1',style: getBodyStyle(color: AppColors.white)),
        ],
       ),
       const Spacer(),
       Container(
        width: 0.5,
        height: 60,
        color: AppColors.white,
       ),
       const Gap(10),
         RotatedBox(
        quarterTurns: 3,
        child: Text('TODDO',style: getTitleStyle(color: AppColors.white,fontSize: 14,),),)
    
     ],),
    );
  }
}