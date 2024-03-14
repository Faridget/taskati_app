import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/colors.dart';

// ignore: camel_case_types
class custombtn extends StatelessWidget {
  const custombtn({
    super.key, required this.text, required this.onPressed, required this.width, this.height,
  });
final String text;
final Function() onPressed;
final double width;
final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??50,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed, child:  Text(text,style: const TextStyle(fontSize: 18),),),
    );
  }
}