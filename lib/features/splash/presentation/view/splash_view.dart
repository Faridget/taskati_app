import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/txt_styal.dart';
import 'package:taskati_app/features/home/presentation/view/home_view.dart';
import 'package:taskati_app/features/upload/presentation/view/upload_view.dart';

class SplashViwe extends StatefulWidget {
  const SplashViwe({super.key});

  @override
  State<SplashViwe> createState() => _SplashViweState();
}

class _SplashViweState extends State<SplashViwe> {
  @override
  void initState() {
    super.initState();
    bool isUpload =AppLocalStorage.getCachedDate('isUpload')?? false;
    Future.delayed(const Duration(seconds: 3), () {
      navigatReplace(
        context,(isUpload)? const HomeView():
        const UploadView(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/splash.json'),
            Text(
              'Taskati',
              style: getTitleStyle(context),
            ),
            const Gap(20),
            Text(
              'Orginz Your Time',
              style: getBodyStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
