import 'dart:developer';
import 'dart:io';

import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:app/utils/permission_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Ownerpassportphoto extends StatefulWidget {
  const Ownerpassportphoto({super.key});

  @override
  State<Ownerpassportphoto> createState() => _OwnerpassportphotoState();
}

class _OwnerpassportphotoState extends State<Ownerpassportphoto> {
  final String _Image_path = "assets/images/id2.png";
  final String _Image2_path = "assets/images/id1.png";
  XFile? _front_selectedImage;
  XFile? _back_selectedImage;

  bool is1Selected = false;
  // bool is2Selected = false;
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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "صورة البطاقة الشخصية",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      is1Selected
                          ? "إلتقط صورة البطاقة من الخلف"
                          : "إلتقط صورة البطاقة من الامام",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "tajawal",
                      ),
                    ),

                    SizedBox(height: 70.h),
                    Center(
                      child:
                          is1Selected
                              ? _back_selectedImage != null
                                  ? Image.file(
                                    File(_back_selectedImage!.path),
                                    height: 360.h,
                                    width: 260.w,
                                  )
                                  : Image.asset(
                                    _Image2_path,
                                    // width: 260.w,
                                    height: 360.h,
                                  )
                              : _front_selectedImage != null
                              ? Image.file(
                                File(_front_selectedImage!.path),
                                height: 360.h,
                                width: 260.w,
                              )
                              : Image.asset(
                                _Image_path,
                                // width: 260.w,
                                height: 360.h,
                              ),
                    ),
                  ],
                ),

                // SizedBox(height: 50.h),
                Positioned(
                  bottom: 100.h,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: 353.w,
                    height: 50.h,
                    child: themeButton(
                      context: context,
                      text: "إلتقط الصورة",
                      textcolor: Colors.white,
                      color: AppColors.buttonColor,
                      width: 353.w,
                      height: 50.h,
                      onPressed:
                          () =>
                              is1Selected
                                  ? _pickImageFromGallery(2)
                                  : _pickImageFromGallery(1),
                    ),
                  ),
                ),
                if (_front_selectedImage != null)
                  Positioned(
                    bottom: 50.h,
                    child: Container(
                      // margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      width: 353.w,
                      height: 50.h,
                      child: themeButton(
                        context: context,
                        color: AppColors.buttonColor,
                        width: 353.w,
                        textcolor: Colors.white,
                        height: 50.h,
                        text: "تم",
                        onPressed:
                            _back_selectedImage != null
                                ? () {
                                  Navigator.pop(context);
                                }
                                : () {
                                  setState(() {
                                    is1Selected = true;
                                  });
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

  Future<void> _pickImageFromGallery(int index) async {
    log("pressed ", name: "pressed");
    final granted = await PermissionManager.requestPhotosPermission();

    log("granted $granted", name: "granted");

    if (granted) {
      if (index == 1) {
        try {
          XFile? _pickedFile = await ImagePicker().pickImage(
            source: ImageSource.gallery,
          );
          log("pickedFile $_pickedFile", name: "pickedfile");
          if (_pickedFile != null) {
            setState(() {
              _front_selectedImage = _pickedFile;
            });
          } else {
            log("no image selected", name: "image picker");
          }
        } catch (e) {
          log("error while picking image", name: "image picker");
        }
      } else {
        try {
          XFile? _pickedFile = await ImagePicker().pickImage(
            source: ImageSource.gallery,
          );
          log("pickedFile $_pickedFile", name: "pickedfile");
          if (_pickedFile != null) {
            setState(() {
              _back_selectedImage = _pickedFile;
            });
          } else {
            log("no image selected", name: "image picker");
          }
        } catch (e) {
          log("error while picking image", name: "image picker");
        }
      }
    } else {}
    // if (await permissionStatus.isGranted) {
    //   if (index == 1) {
    //     _comm_selectedImage = await _pickImageFromGallery();
    //     if (_comm_selectedImage != null) {
    //       setState(() {
    //         _comm_temp = _comm_selectedImage;
    //       });
    //     }
    //   } else {
    //     _tax_selectedImage = await _pickImageFromGallery();
    //     if (_tax_selectedImage != null) {
    //       setState(() {
    //         _tax_temp = _tax_selectedImage;
    //       });
    //     }
    //   }
    // }
  }
}
