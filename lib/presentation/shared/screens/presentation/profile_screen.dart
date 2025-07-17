import 'dart:developer';
import 'dart:io';

import 'package:app/presentation/features/auth/login/login_screen.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/features/auth/register/user_model.dart';
import 'package:app/presentation/shared/screens/presentation/contact_us.dart';
import 'package:app/utils/permission_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile({super.key});

  @override
  ConsumerState<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile> {
  XFile? pickedUserPhoto;
  void _getFromGallery() async {
    log("pressed ", name: "pressed");
    final granted = await PermissionManager.requestPhotosPermission();
    log("granted $granted", name: "granted");
    if (granted) {
      try {
        XFile? _pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        log("pickedFile $_pickedFile", name: "pickedfile");
        if (_pickedFile != null) {
          setState(() {
            pickedUserPhoto = _pickedFile;
          });
        } else {
          log("no image selected", name: "image picker");
        }
      } catch (e) {
        log("error while picking image", name: "image picker");
      }
    } else {
      log("permission denied", name: "permission");
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authenticatedUserProvider);
    log("user: ${user!.email}");
    log("user: ${user.id}");

    log("user: ${user.name}");

    log("user: ${user.phone}");

    log("user: ${user.role}");

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: SafeArea(
          child: Container(
            height: 60.h,
            // color: Colors.red,
            margin: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: 30),
                ),
                TextButton(
                  onPressed: () {
                    _showMyDialog(context);
                  },

                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    foregroundColor: WidgetStatePropertyAll(
                      AppColors.primaryColor,
                    ),
                  ),
                  child: Text(
                    "تسجيل الخروج",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipOval(
                    child: Container(
                      width: 125.r,
                      height: 125.r,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child:
                          pickedUserPhoto != null
                              ? Image.file(
                                File(pickedUserPhoto!.path),
                                fit: BoxFit.cover,
                              )
                              : Icon(
                                Icons.person,
                                size: 90.r, // Adjust size as needed
                                color: Colors.grey,
                              ),
                    ),
                  ),

                  Positioned(
                    top: 85.h,
                    left: 80.w,
                    child: Container(
                      height: 40.h,
                      // padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: IconButton(
                        onPressed: _getFromGallery,
                        icon: Icon(
                          color: Colors.white,
                          pickedUserPhoto == null
                              ? Icons.add_photo_alternate
                              : Icons.edit,
                          size: 25.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "البيانات الشخصية",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Card(
                shadowColor: Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  height: 125.h,
                  width: 353.w,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstants.cardRadius,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            user.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            "الاسم",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),
                      Container(
                        width: 318.w,
                        height: 1.h,
                        decoration: BoxDecoration(
                          color: AppColors.cardBorderColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            user.phone,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            "رقم الهاتف",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "البيانات القانونية",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "يرجي ملئ البيانات القانونية إذا اردت طلب فاتورة إلكترونية *",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 12.sp,
                            fontFamily: "tajawal",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Card(
                shadowColor: Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  height: 60.h,
                  width: 353.w,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstants.cardRadius,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "20359876",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "الرقم الضريبي",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Card(
                shadowColor: Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  height: 60.h,
                  width: 353.w,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstants.cardRadius,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "صورة من السجل الضريبي",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Icon(Icons.image_outlined),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Card(
                shadowColor: Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  height: 60.h,
                  width: 353.w,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstants.cardRadius,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "صورة من البطاقة الضريبية",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Icon(Icons.image_outlined),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsScreen()),
                  );
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: SizedBox(
                  width: 230.w,
                  height: 70.h,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 10.w),
                        Icon(Icons.call, size: 50.r),
                        Text("تواصل معنا"),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: Colors.white,
            title: const Text('تسجيل الخروج'),
            content: SizedBox(
              width: 300.w,
              child: Text('هل انت متأكد من تسجيل الخروج؟'),
            ),
            actions: <Widget>[
              TextButton(
                style: Theme.of(context).textButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  foregroundColor: WidgetStatePropertyAll(
                    AppColors.primaryColor,
                  ),
                ),
                child: Text(
                  'إلغاء',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'تسجيل الخروج',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
