import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class DriverSelfiephoto extends StatefulWidget {
  const DriverSelfiephoto({super.key});

  @override
  State<DriverSelfiephoto> createState() => _DriverSelfiephotoState();
}

class _DriverSelfiephotoState extends State<DriverSelfiephoto> {
  String _imagePath = "assets/images/selfie.png";
  XFile? selectedSelfie;
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
                    child: Image.asset(
                      _imagePath,
                      // width: 260.w,
                      height: 260.h,
                    ),
                  ),

                  SizedBox(height: 70.h),
                  themeButton(
                    color: AppColors.buttonColor,
                    width: 353.w,
                    height: 50.h,
                    context: context,
                    textcolor: Colors.white,
                    text: "إلتقط الصورة",
                    onPressed: () async {
                      final permissionStatus =
                          await Permission.photos.request();
                      if (permissionStatus.isGranted) {
                        selectedSelfie = await _pickImageFromGallery();
                        if (selectedSelfie != null) {
                          setState(() {
                            _imagePath = selectedSelfie!.path;
                          });
                        }
                      }
                    },
                  ),
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
