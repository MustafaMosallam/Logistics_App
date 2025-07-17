import 'dart:developer';
import 'package:app/presentation/features/auth/get_code/auth_type_state.dart';
import 'package:app/presentation/features/auth/get_code/get_code.dart';
import 'package:app/presentation/features/auth/login/login_screen.dart';
import 'package:app/constants/app_assets.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/register_login_TextField.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/presentation/features/auth/register/register_viewmodel.dart';
import 'package:app/presentation/features/auth/get_code/getCode_viewmodel.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  // final _nameController = TextEditingController();

  // final _phoneController = TextEditingController();

  // final _emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(registerUserProvider.notifier).resetState();
    });
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerUserProvider);
    final viewmodel = ref.read(registerUserProvider.notifier);
    final getcodeviewmodel = ref.read(getCodeProvider.notifier);
    final getCodestate = ref.watch(getCodeProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
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
                      "ادخل بياناتك",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "الأسم كامل",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(
                              // height: AppConstants.RTextFieldHeight,
                              child: registerLoginTextField(
                                errorText: state.nameError,
                                onChanged: viewmodel.onNameChanged,
                                // controller: _nameController,
                                validator: (_) => null,

                                // validator: (value) {
                                //   if (value == null || value.trim().isEmpty) {
                                //     return 'الاسم مطلوب';
                                //   }

                                //   // Check if the name has at least two words (first + last)
                                //   final parts = value.trim().split(
                                //     RegExp(r'\s+'),
                                //   );
                                //   if (parts.length < 2) {
                                //     return 'يجب إدخال الاسم الكامل (الاسم واللقب)';
                                //   }

                                //   // Optional: disallow digits or symbols
                                //   final regex = RegExp(
                                //     r'^[\p{L}\s]+$',
                                //     unicode: true,
                                //   );
                                //   if (!regex.hasMatch(value)) {
                                //     return 'الاسم يجب أن يحتوي على أحرف فقط بدون أرقام أو رموز';
                                //   }

                                //   return null; // ✅ Valid
                                // },
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "رقم الهاتف",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(
                              // height: AppConstants.RTextFieldHeight,
                              child: registerLoginTextField(
                                errorText: state.phoneError,
                                onChanged: viewmodel.onPhoneNumberChanged,
                                // controller: _phoneController,
                                validator: (_) => null,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
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
                                //     return 'رقم الهاتف غير صالح. تأكد من إدخاله بشكل صحيح';
                                //   }

                                //   return null; // ✅ Valid
                                // },
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "الإيميل اللإلكتروني",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),

                            SizedBox(
                              // height: AppConstants.RTextFieldHeight,
                              child: registerLoginTextField(
                                errorText: state.emailError,
                                onChanged: viewmodel.onEmailChanged,
                                // controller: _emailController,
                                validator: (_) => null,
                                //(value) {
                                //   if (value == null || value.trim().isEmpty) {
                                //     return 'البريد الإلكتروني مطلوب';
                                //   }

                                //   final normalized = value.trim();

                                //   // Basic email pattern (RFC 5322 simplified)
                                //   final regex = RegExp(
                                //     r'^[\w\.-]+@[\w\.-]+\.\w{2,}$',
                                //   );

                                //   if (!regex.hasMatch(normalized)) {
                                //     return 'البريد الإلكتروني غير صالح';
                                //   }

                                //   return null; // ✅ Valid
                                // },
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "هل لديك حساب بالفعل؟",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          style: Theme.of(
                            context,
                          ).textButtonTheme.style?.copyWith(
                            padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                          ),
                          child: Text(
                            "تسجيل الدخول ",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 54.h),
                    ElevatedButton(
                      onPressed: () async {
                        viewmodel.validateAllFields();
                        log("isFormValid ${state.isFormValid}");
                        log("isNameValid ${state.isNameValid}");
                        log("isEmailValid ${state.isEmailValid}");
                        log("isPhoneValid ${state.isPhoneValid}");

                        if (state.isFormValid) {
                          log("Name: ${state.name}");
                          log("Email: ${state.email}");
                          log("Phone: ${state.phoneNumber}");
                          // showSnackBarTop(
                          //   context: context,
                          //   message: "تم التسجيل بنجاح",
                          //   textColor: Colors.white,
                          //   bgColor: const Color.fromARGB(255, 117, 255, 121),
                          // );

                          await getcodeviewmodel.sendCode(email: state.email);
                          ref.read(authTypeProvider.notifier).state =
                              AuthTypeState.register;

                          if (!getCodestate.isLoading && context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GetCode(),
                              ),
                            );
                          }
                        }
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
                            getCodestate.isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  "التالي",
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
                    //   text: "التالي",
                    //   onPressed: () {
                    //     viewmodel.validateAllFields();
                    //     log("isFormValid ${state.isFormValid}");
                    //     log("isNameValid ${state.isNameValid}");
                    //     log("isEmailValid ${state.isEmailValid}");
                    //     log("isPhoneValid ${state.isPhoneValid}");

                    //     if (state.isFormValid) {
                    //       log("Name: ${state.name}");
                    //       log("Email: ${state.email}");
                    //       log("Phone: ${state.phoneNumber}");
                    //       // showSnackBarTop(
                    //       //   context: context,
                    //       //   message: "تم التسجيل بنجاح",
                    //       //   textColor: Colors.white,
                    //       //   bgColor: const Color.fromARGB(255, 117, 255, 121),
                    //       // );
                    //       GetcodeViewmodel.sendCode(email: state.email);

                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => GetCode()),
                    //       );
                    //     }
                    //   },
                    //   color: AppColors.buttonColor,
                    //   width: 200.w,
                    //   height: 53.h,
                    //   textcolor: Colors.white,
                    // ),
                  ],
                ),
              ),
            ),
          ),

          // Positioned(
          //   bottom: 100.h,
          //   child: SizedBox(
          //     child: themeButton(
          //       context: context,
          //       text: "التالي",
          //       onPressed: () {
          //         if (_formkey.currentState!.validate()) {
          //           // showSnackBarTop(
          //           //   context: context,
          //           //   message: "تم التسجيل بنجاح",
          //           //   textColor: Colors.white,
          //           //   bgColor: const Color.fromARGB(255, 117, 255, 121),
          //           // );
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => GetCode()),
          //           );
          //         }
          //       },
          //       color: AppColors.buttonColor,
          //       width: 200.w,
          //       height: 53.h,
          //       textcolor: Colors.white,
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
