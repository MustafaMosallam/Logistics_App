import 'package:app/presentation/features/auth/login/login_screen.dart';
import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                ),
              ),
            ),
            listTileTheme: ListTileThemeData(
              iconColor: Colors.black,
              textColor: Colors.black,
            ),
            expansionTileTheme: const ExpansionTileThemeData(
              iconColor: AppColors.primaryColor,
              collapsedIconColor: AppColors.secondaryColor,
            ),
            appBarTheme: AppBarTheme(backgroundColor: Colors.white),
            cardColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.buttonTextColor,
                textStyle: TextStyle(
                  fontSize: 22.r,
                  fontFamily: 'tajawal',
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'tajawal',
            textTheme: TextTheme(
              titleLarge: TextStyle(
                fontSize: 18.r,
                fontFamily: 'tajawal',
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
              headlineMedium: TextStyle(
                fontSize: 20.r,
                fontFamily: 'tajawal',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              headlineLarge: TextStyle(
                fontSize: 24.r,
                fontFamily: 'tajawal',
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              labelLarge: TextStyle(
                color: AppColors.buttonTextColor,
                fontSize: 16.r,
                fontFamily: "tajawal",
              ),
              titleSmall: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                fontSize: 20.sp,
                fontFamily: "tajawal",
              ),
              bodyMedium: TextStyle(
                fontSize: 14.r,
                fontFamily: 'tajawal',
                fontWeight: FontWeight.normal,
                color: AppColors.textColor,
              ),
              bodyLarge: TextStyle(
                fontSize: 14.r,
                fontFamily: 'tajawal',
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              bodySmall: TextStyle(
                fontSize: 12.r,
                fontFamily: 'tajawal',
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              labelMedium: TextStyle(
                fontFamily: "tajawal",
                fontSize: 22.r,
                fontWeight: FontWeight.bold,
              ),
              labelSmall: TextStyle(
                color: AppColors.buttonTextColor,
                fontSize: 12.r,
                fontFamily: "tajawal",
              ),
            ),
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}

// class CustomSplashScreen extends StatefulWidget {
//   const CustomSplashScreen({super.key});

//   @override
//   State<CustomSplashScreen> createState() => _CustomSplashScreenState();
// }

// class _CustomSplashScreenState extends State<CustomSplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToHome();
//   }

//   _navigateToHome() async {
//     await Future.delayed(
//       const Duration(seconds: 3),
//     ); // Adjust duration as needed
//     if (!mounted) return;
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           color: Colors.black, // Match your splash screen background
//         ),
//         child: Image.asset(
//           'assets/images/splash_screen_image.png',
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }
