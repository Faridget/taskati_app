import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/utils/colors.dart';

showImageDialog(context,{onTapCamera,onTapGallery}){
showModalBottomSheet(
  isScrollControlled: true,
  context: context,
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25),topRight: Radius.circular(25),
    )
  ),
   builder: (BuildContext context) {
     return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )
        ),
        child:   Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              GestureDetector(
                onTap: onTapCamera,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary,
                  ),
                  child:Text('Upload From Camera',style: TextStyle(color:AppColors.white ),),
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: onTapGallery,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary,
                  ),
                  child:Text('Upload From Gallery',style: TextStyle(color:AppColors.white ),),
                ),
              ),
          ],
        ),
      ),
      );
   }
   );
}