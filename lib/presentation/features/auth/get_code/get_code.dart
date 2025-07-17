import 'dart:developer';

import 'package:app/presentation/features/auth/get_code/auth_type_state.dart';
import 'package:app/presentation/features/auth/user_type/userType.dart';
import 'package:app/constants/app_assets.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/features/customer/presentation/homeWithBottomBar.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class GetCode extends ConsumerWidget {
  GetCode({super.key});

  final _pinkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameFrom = ref.watch(authTypeProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: SafeArea(
          child: Container(
            height: 50.h,
            // color: Colors.red,
            margin: EdgeInsets.only(
              top: 0.h,
              right: 20.w,
              left: 20.w,
              bottom: 0.h,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: 25.r),
                ),
              ],
            ),
          ),
        ),
      ),

      // PreferredSize(
      //   preferredSize: Size.fromHeight(100.h),
      //   child: SafeArea(
      //     child: Container(
      //       // color: Colors.red,
      //       margin: EdgeInsets.only(bottom: 20.h, left: 20.h, right: 20.h),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           IconButton(
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //             icon: Icon(Icons.arrow_back, size: 25.r),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: AppColors.scaffoldColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                // horizontal: AppConstants.screenPadding.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.logoWithBg,
                    height: AppConstants.logoHeight.h,
                    width: AppConstants.logoWidth.w,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "قم بكتابة الكود للدخول للحساب",
                    style: TextStyle(
                      fontSize: 24.r,
                      fontFamily: 'tajawal',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      "ادخل 4 ارقام المرسلة اليك في\nرسالة نصية",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Form(
                      key: _pinkey,
                      child: Pinput(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال الرمز';
                          }
                          if (value.length < 4) {
                            return 'الرمز يجب أن يتكون من 4 أرقام';
                          }
                          return null;
                        },
                        keyboardAppearance: Brightness.light,
                        submittedPinTheme: PinTheme(
                          width: 50.r,
                          height: 56.r,
                          textStyle: TextStyle(
                            height: 3.1,
                            fontSize: 20.r,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 50.r,
                          height: 56.r,
                          textStyle: TextStyle(
                            height: 3.1,

                            fontSize: 20.r,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        errorPinTheme: PinTheme(
                          width: 50.r,
                          height: 56.r,
                          textStyle: TextStyle(
                            height: 3.1,

                            fontSize: 20.r,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        defaultPinTheme: PinTheme(
                          width: 50.r,
                          height: 56.r,
                          textStyle: TextStyle(
                            height: 3.1,

                            fontSize: 20.r,

                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 115.h,
            child: Column(
              children: [
                SizedBox(
                  child: themeButton(
                    context: context,
                    text: "تأكيد",
                    onPressed: () {
                      log("cameFrom:$cameFrom");
                      if (_pinkey.currentState!.validate()) {
                        if (cameFrom == AuthTypeState.login) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homewithbottombar(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Usertype()),
                          );
                        }
                      }
                    },
                    color: AppColors.buttonColor,
                    width: 200.w,
                    height: 53.h,
                    textcolor: Colors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: Theme.of(context).textButtonTheme.style?.copyWith(
                        padding: WidgetStateProperty.all(
                          EdgeInsets.only(right: 5),
                        ),
                        backgroundColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                      child: Text(
                        "ارسال الرمز",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),

                    Text(
                      "هل تواجه مشكلة؟ أعد",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
