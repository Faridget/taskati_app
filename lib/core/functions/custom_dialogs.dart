import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/colors.dart';

showErroDialog(context ,String text){
   ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.red,
                  content:  Text(text)),
              );
}