import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollow_bit/app/constants/color_constants.dart';
import 'package:hollow_bit/app/constants/text_constants.dart';
import 'package:hollow_bit/presentation/screens/create_account_screen/create_account_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(375, 800),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Hollow',
            theme: ThemeData(
              backgroundColor: ColorConstants.backgroundColor,
              fontFamily: TextConstants.rubikFont,
              primarySwatch: Colors.blue,
            ),
            home: const CreateAccountScreen(),
          );
        });
  }
}
