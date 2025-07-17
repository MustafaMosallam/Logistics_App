import 'dart:developer';
import 'dart:io';
import 'package:app/constants/app_assets.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/register_login_TextField.dart';
import 'package:app/utils/permission_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class OwnerLegalInfoScreen extends StatefulWidget {
  const OwnerLegalInfoScreen({super.key});

  @override
  State<OwnerLegalInfoScreen> createState() => _OwnerLegalInfoScreenState();
}

class _OwnerLegalInfoScreenState extends State<OwnerLegalInfoScreen> {
  XFile? _comm_selectedImage;
  XFile? _tax_selectedImage;
  XFile? _comm_temp;
  XFile? _tax_temp;
  final _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30.h,
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
                  "البيانات القانونية",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "الرقم الضريبي",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 5.h),

                        SizedBox(
                          height: AppConstants.RTextFieldHeight,
                          child: registerLoginTextField(
                            errorText: null,
                            onChanged: (_) {},
                            controller: _numberController,
                            validator: (value) {
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),

                        SizedBox(height: 20.h),
                        Text(
                          "صورة السجل التجاري",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 5.h),

                        _buildImagePicker(1),

                        SizedBox(height: 20.h),
                        Text(
                          "صورة السجل الضريبي",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 5.h),
                        _buildImagePicker(2),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker(int index) {
    return GestureDetector(
      onTap: () async {
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
                  _comm_selectedImage = _pickedFile;
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
                  _tax_selectedImage = _pickedFile;
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
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.cardBorderColor),
          ),
          child:
              index == 1
                  ? (_comm_selectedImage != null
                      ? Image.file(
                        File(_comm_selectedImage!.path),
                        width: 200.w,
                      )
                      : normalRow())
                  : (_tax_selectedImage != null
                      ? Image.file(File(_tax_selectedImage!.path), width: 200.w)
                      : normalRow()),
          //   children: [
          //     Icon(Icons.attach_file, color: Colors.black),
          //     SizedBox(width: 8),
          //     // Expanded(
          //     //   child: SingleChildScrollView(
          //     //     scrollDirection: Axis.horizontal,
          //     //     physics: const BouncingScrollPhysics(),
          //     //     child: Text(
          //     //       index == 1
          //     //           ? (_comm_temp != null
          //     //               ? _comm_temp!.name
          //     //               : "اختر الصورة")
          //     //           : (_tax_temp != null ? _tax_temp!.name : "اختر الصورة"),
          //     //       style: TextStyle(
          //     //         fontSize: 16,
          //     //         color: Colors.black,
          //     //         fontWeight: FontWeight.bold,
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // ),
        ),
      ),
    );
  }

  Widget normalRow() {
    return Row(
      children: [
        Icon(Icons.attach_file, color: Colors.black),
        SizedBox(width: 8),
        Text(
          "اختر الصورة",

          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
