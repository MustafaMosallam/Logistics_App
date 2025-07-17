import 'dart:developer';

import 'package:app/presentation/features/auth/get_code/auth_type_state.dart';
import 'package:app/presentation/features/auth/get_code/get_code.dart';
import 'package:app/presentation/features/auth/login/login_viewmodel.dart';
import 'package:app/presentation/features/auth/register/register_screen.dart';
import 'package:app/presentation/features/customer/presentation/homeWithBottomBar.dart';
import 'package:app/constants/app_assets.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/register_login_TextField.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  // final _phoneController = TextEditingController();

  // String errorText = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(loginUserProvider.notifier);
    var state = ref.watch(loginUserProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                // height: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: AppConstants.screenPadding,
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
                        "تسجيل الدخول",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "رقم الهاتف",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 5.h),

                      Form(
                        key: _formkey,
                        child: registerLoginTextField(
                          errorText: state.phoneError,
                          onChanged: viewmodel.onPhoneChanged,
                          // controller: _phoneController,
                          validator: null,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     // errorText = 'required';
                          //     return 'رقم الهاتف مطلوب';
                          //   }

                          //   final normalized = value.replaceAll(
                          //     RegExp(r'\s+'),
                          //     '',
                          //   );

                          //   final regex = RegExp(
                          //     r'^(?:\+20|0)?1[0125][0-9]{8}$',
                          //   );

                          //   if (!regex.hasMatch(normalized)) {
                          //     // errorText = 'invalid';
                          //     return 'رقم الهاتف غير صالح. تأكد من إدخاله بشكل صحيح';
                          //   }

                          //   return null; // ✅ Valid
                          // },
                          keyboardType: TextInputType.phone,
                        ),
                      ),

                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "ليس لديك حساب؟",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            style: Theme.of(
                              context,
                            ).textButtonTheme.style?.copyWith(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.transparent,
                              ),
                            ),
                            child: Text(
                              "انشاء حساب ",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100.h,
              // width: AppConstants.RButtonWidth,
              // height: AppConstants.RButtonHeight,
              child: ElevatedButton(
                onPressed: () async {
                  viewmodel.validate();
                  if (state.isFormValid) {
                    // showSnackBarTop(
                    //   context: context,
                    //   bgColor: AppColors.primaryColor,
                    //   message: "تم تسجيل الدخول بنجاح",
                    //   textColor: Colors.white,
                    // );
                    await viewmodel.login();
                    ref.read(authTypeProvider.notifier).state =
                        AuthTypeState.login;
                    state = ref.watch(loginUserProvider);
                    log("isLoading:${state.isLoading}");
                    log("isToken:${state.token}");
                    if (state.isLoading == false && context.mounted) {
                      if (state.token != null) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => Homewithbottombar(),
                            builder: (context) => GetCode(),
                          ),
                          (route) => false,
                        );
                      } else {
                        log("Error: ${state.errorMessage}");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage ?? "حدث خطأ"),
                          ),
                        );
                      }
                    }
                  }
                  // else {
                  //   if (errorText == 'required') {
                  //     showSnackBarTop(
                  //       context: context,
                  //       bgColor: AppColors.alertRedColor,
                  //       message: "!ادخل رقم الهاتف",
                  //       textColor: Colors.white,
                  //     );
                  //   } else if (errorText == 'invalid') {
                  //     showSnackBarTop(
                  //       context: context,
                  //       bgColor: AppColors.alertRedColor,
                  //       message: 'رقم الهاتف غير صالح. تأكد من إدخاله بشكل صحيح',
                  //       textColor: Colors.white,
                  //     );
                  //   }
                  // }
                  // bool isValid = false;
                  // if (isValid) {

                  //   showSnackBarTop(
                  //     context: context,
                  //     bgColor: AppColors.alertRedColor,
                  //     message: "!ادخل رقم الهاتف",
                  //     textColor: Colors.white,
                  //   );
                  // } else {
                  //   Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Homewithbottombar(),
                  //     ),
                  //     (route) => false,
                  //   );
                  //   showSnackBarTop(
                  //     context: context,
                  //     bgColor: const Color.fromARGB(255, 117, 255, 122),
                  //     message: "تم تسجيل الدخول بنجاح",
                  //     textColor: Colors.white,
                  //   );
                  // }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    AppColors.buttonColor,
                  ),
                  elevation: WidgetStateProperty.all(0),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.RButtonRadius,
                      ),
                    ),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 200.w,
                  height: 53.h,
                  child:
                      state.isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                            "دخول",
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                ),
              ),

              // themeButton(
              //   context: context,
              //   text: "دخول",
              //   onPressed: () async {
              //     viewmodel.validate();
              //     if (state.isFormValid) {
              //       // showSnackBarTop(
              //       //   context: context,
              //       //   bgColor: AppColors.primaryColor,
              //       //   message: "تم تسجيل الدخول بنجاح",
              //       //   textColor: Colors.white,
              //       // );
              //       await viewmodel.login();
              //       state = ref.watch(loginUserProvider);
              //       log("isLoading:${state.isLoading}");
              //       log("isToken:${state.token}");
              //       if (state.isLoading == false && context.mounted) {
              //         if (state.token != null) {
              //           Navigator.pushAndRemoveUntil(
              //             context,
              //             MaterialPageRoute(
              //               // builder: (context) => Homewithbottombar(),
              //               builder: (context) => GetCode(),
              //             ),
              //             (route) => false,
              //           );
              //         } else {
              //           log("Error: ${state.errorMessage}");
              //           ScaffoldMessenger.of(context).showSnackBar(
              //             SnackBar(
              //               content: Text(state.errorMessage ?? "حدث خطأ"),
              //             ),
              //           );
              //         }
              //       }
              //     }
              //     // else {
              //     //   if (errorText == 'required') {
              //     //     showSnackBarTop(
              //     //       context: context,
              //     //       bgColor: AppColors.alertRedColor,
              //     //       message: "!ادخل رقم الهاتف",
              //     //       textColor: Colors.white,
              //     //     );
              //     //   } else if (errorText == 'invalid') {
              //     //     showSnackBarTop(
              //     //       context: context,
              //     //       bgColor: AppColors.alertRedColor,
              //     //       message: 'رقم الهاتف غير صالح. تأكد من إدخاله بشكل صحيح',
              //     //       textColor: Colors.white,
              //     //     );
              //     //   }
              //     // }
              //     // bool isValid = false;
              //     // if (isValid) {

              //     //   showSnackBarTop(
              //     //     context: context,
              //     //     bgColor: AppColors.alertRedColor,
              //     //     message: "!ادخل رقم الهاتف",
              //     //     textColor: Colors.white,
              //     //   );
              //     // } else {
              //     //   Navigator.pushAndRemoveUntil(
              //     //     context,
              //     //     MaterialPageRoute(
              //     //       builder: (context) => Homewithbottombar(),
              //     //     ),
              //     //     (route) => false,
              //     //   );
              //     //   showSnackBarTop(
              //     //     context: context,
              //     //     bgColor: const Color.fromARGB(255, 117, 255, 122),
              //     //     message: "تم تسجيل الدخول بنجاح",
              //     //     textColor: Colors.white,
              //     //   );
              //     // }
              //   },
              //   color: AppColors.buttonColor,
              //   width: 200.w,
              //   height: 53.h,
              //   textcolor: Colors.white,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
