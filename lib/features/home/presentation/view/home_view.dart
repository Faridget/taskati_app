import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/colors.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                      Text('Hello Ahmed',
                      style: getTitleStyle(color: AppColors.primary),),
                       Text('Have A nice Day',style: getBodyStyle(),),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                ],
              )
            ],
           ),
         ),
            
      ),
    );
  }
}