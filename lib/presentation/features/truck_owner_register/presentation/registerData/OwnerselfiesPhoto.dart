import 'dart:developer';
import 'dart:io';

import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:app/utils/permission_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class OwnerSelfiephoto extends StatefulWidget {
  const OwnerSelfiephoto({super.key});

  @override
  State<OwnerSelfiephoto> createState() => _OwnerSelfiephotoState();
}

class _OwnerSelfiephotoState extends State<OwnerSelfiephoto> {
  final String _imagePath = "assets/images/selfie.png";
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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.screenPadding.w,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "التقط صورة ملفك الشخصي",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "اتبع التعليمات التاليه لإلتقاط صورة شخصية لك",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "tajawal",
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    "1. واجه الكاميرا مباشرة مع التأكد من وضوح   العينين والفم",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.black,
                      wordSpacing: 7,
                      fontWeight: FontWeight.bold,
                      fontFamily: "tajawal",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "2. تأكد من أن الصورة مضاءة جيدًا، خالية من الوهج، وواضحة التركيز",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.black,
                      wordSpacing: 7,
                      fontWeight: FontWeight.bold,
                      fontFamily: "tajawal",
                    ),
                  ),
                  SizedBox(height: 70.h),
                  Center(
                    child:
                        pickedUserPhoto == null
                            ? Image.asset(
                              _imagePath,
                              // width: 260.w,
                              height: 260.h,
                              errorBuilder: (context, error, stackTrace) {
                                return Text('Image failed to load: $error');
                              },
                            )
                            : Image.file(
                              File(pickedUserPhoto!.path),
                              height: 250.h,
                            ),
                  ),

                  SizedBox(height: 50.h),
                  themeButton(
                    color: AppColors.buttonColor,
                    width: 353.w,
                    height: 50.h,
                    context: context,
                    textcolor: Colors.white,
                    text: "إلتقط الصورة",
                    onPressed: _getFromGallery,
                  ),
                  if (pickedUserPhoto != null) ...[
                    SizedBox(height: 10.h),
                    themeButton(
                      color: AppColors.buttonColor,
                      width: 353.w,
                      height: 50.h,
                      context: context,
                      textcolor: Colors.white,
                      text: "تم",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                  // SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<XFile?> _pickImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    return pickedImage;
  }
}
