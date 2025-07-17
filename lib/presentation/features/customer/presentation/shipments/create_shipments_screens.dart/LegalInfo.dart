import 'dart:developer';
import 'dart:io';
import 'package:app/constants/app_assets.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/presentation/done_screen.dart';
import 'package:app/presentation/shared/widgets/register_login_TextField.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:app/utils/permission_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class LegalInfoScreen extends StatefulWidget {
  const LegalInfoScreen({super.key});

  @override
  State<LegalInfoScreen> createState() => _LegalInfoScreenState();
}

class _LegalInfoScreenState extends State<LegalInfoScreen> {
  XFile? _comm_selectedImage;
  XFile? _tax_selectedImage;

  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
        ),
      ),
      // PreferredSize(
      //   preferredSize: Size.fromHeight(50.h),
      //   child: SafeArea(
      //     child: Container(
      //       height: 50.h,
      //       color: Colors.amber,
      //       margin: EdgeInsets.only(top: 0.h, left: 20.h),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           IconButton(
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //             icon: Icon(Icons.arrow_back),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.h,
                  horizontal: AppConstants.screenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.logoWithBg,
                      height: AppConstants.logoHeight,
                      width: AppConstants.logoWidth,
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
                            SizedBox(height: 50.h),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 50.h,
              child: themeButton(
                context: context,
                text: "انتهيت",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const DoneScreen(
                            home: true,
                            donetext: "تم انشاء الشحنة بنجاح",
                          ),
                    ),
                  );
                },
                color: AppColors.primaryColor,
                width: 240.w,
                height: 63.h,
                textcolor: Colors.white,
              ),
            ),
          ],
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

  // Future<XFile?> _pickImageFromGallery() async {
  //   final pickedImage = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //   );

  //   // print(pickedImage!);
  //   return pickedImage;
  // }
}
