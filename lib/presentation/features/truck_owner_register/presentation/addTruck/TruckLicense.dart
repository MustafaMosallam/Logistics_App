import 'dart:developer';
import 'dart:io';

import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:app/utils/permission_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class TrucklicensePhoto extends StatefulWidget {
  const TrucklicensePhoto({super.key});

  @override
  State<TrucklicensePhoto> createState() => _TrucklicensePhotoState();
}

class _TrucklicensePhotoState extends State<TrucklicensePhoto> {
  final String _Image_path = "assets/images/Carlicense.png";
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.screenPadding.w),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "صورة رخصة الشاحنة",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "إلتقط صورة الرخصة من الأمام و الخلف",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "tajawal",
                      ),
                    ),

                    SizedBox(height: 70.h),
                    Center(
                      child:
                          pickedUserPhoto == null
                              ? Image.asset(
                                _Image_path,
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
                  ],
                ),

                Positioned(
                  bottom: 100.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    margin: EdgeInsets.only(bottom: 10.h),
                    width: 353.w,
                    height: 50.h,
                    child: themeButton(
                      context: context,
                      text: "إلتقط الصورة",
                      textcolor: Colors.white,
                      color: AppColors.buttonColor,
                      width: 353.w,
                      height: 50.h,
                      onPressed: _getFromGallery,
                    ),
                  ),
                ),
                if (pickedUserPhoto != null)
                  Positioned(
                    bottom: 50.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      // margin: EdgeInsets.only(bottom: 10.h),
                      width: 353.w,
                      height: 50.h,
                      child: themeButton(
                        context: context,
                        color: AppColors.buttonColor,
                        width: 353.w,
                        textcolor: Colors.white,
                        height: 50.h,
                        text: "تم",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
              ],
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
