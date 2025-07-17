import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Drivelicense extends StatefulWidget {
  const Drivelicense({super.key});

  @override
  State<Drivelicense> createState() => _DrivelicenseState();
}

class _DrivelicenseState extends State<Drivelicense> {
  final String _Image_path = "assets/images/driverlicense.png";
  XFile? selectedSelfie;
  bool isSelected = false;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "التقط صورة رخصة القيادة",
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
                        child: Image.asset(
                          _Image_path,
                          // width: 260.w,
                          height: 360.h,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 70.h),
                Container(
                  margin: EdgeInsets.only(bottom: 70),
                  width: 353.w,
                  height: 50.h,
                  child:
                      isSelected
                          ? themeButton(
                            context: context,
                            color: AppColors.buttonColor,
                            width: 353.w,
                            textcolor: Colors.white,
                            height: 50.h,
                            text: "تم",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                          : themeButton(
                            context: context,
                            text: "إلتقط الصورة",
                            textcolor: Colors.white,
                            color: AppColors.buttonColor,
                            width: 353.w,
                            height: 50.h,
                            onPressed: () async {
                              // final permissionStatus =
                              //     await Permission.photos.request();
                              // if (permissionStatus.isGranted) {
                              //   selectedSelfie = await _pickImageFromGallery();
                              //   if (selectedSelfie != null) {
                              //     setState(() {
                              //       _Image_path = selectedSelfie!.path;
                              //     });
                              //   }
                              // }
                              print("done capturing");
                              setState(() {
                                isSelected = true;
                              });
                            },
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
