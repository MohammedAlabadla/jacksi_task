import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jacksi/utils/locale_db.dart';

import 'constants/constants.dart';
import 'controllers/app_binding.dart';
import 'screens/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDB.instance.onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'jacksi',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          initialBinding: AppBindings(),
          locale: const Locale('ar'),
          fallbackLocale: const Locale('ar'),
          theme: ThemeData(
            fontFamily: '',
            primaryColor: kPrimColor,
            scaffoldBackgroundColor: ksbgColor,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
                fontFamily: kFontFamilyName,
              ),
            ),
            textTheme: Typography.englishLike2018.apply(
              fontSizeFactor: 1.sp,
              displayColor: Colors.black,
              bodyColor: Colors.black,
              decorationColor: Colors.black,
              fontFamily: kFontFamilyName,
            ),
            elevatedButtonTheme: const ElevatedButtonThemeData(),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  letterSpacing: 0,
                  fontFamily: kFontFamilyName,
                ),
              ),
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
