import 'dart:io';

import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class AddTruckspecs extends StatefulWidget {
  const AddTruckspecs({super.key});

  @override
  State<AddTruckspecs> createState() => _AddTruckspecsState();
}

class _AddTruckspecsState extends State<AddTruckspecs> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedCountry;
  String? selectedCity;
  String? selectedPhoneCode;
  List<XFile> truckImages = [];
  @override
  Widget build(BuildContext context) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.screenPadding.w,
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مواصفات الشاحنة',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),

                      SizedBox(height: 20.h),
                      Text("نوع الشاحنة", style: titleLarge),
                      SizedBox(height: 3.h),
                      buildDropdownField(['السعودية', 'مصر'], (value) {
                        setState(() => selectedCountry = value);
                      }),

                      SizedBox(height: 5.h),
                      Text("رقم الشاحنة", style: titleLarge),
                      SizedBox(height: 3.h),
                      buildTextField(),
                      SizedBox(height: 16.h),

                      Text("رقم المقطورة", style: titleLarge),
                      SizedBox(height: 3.h),
                      buildTextField(),
                      SizedBox(height: 16.h),

                      Text("وزن الشاحنة (طن)", style: titleLarge),
                      SizedBox(height: 3.h),
                      buildTextField(),

                      SizedBox(height: 16.h),

                      Text("صور الشاحنة", style: titleLarge),
                      SizedBox(height: 3.h),
                      _buildImageContainer(),
                      SizedBox(height: 16.h),

                      Text("صور المقطورة (إن وجدت)", style: titleLarge),
                      SizedBox(height: 3.h),
                      _buildImageContainer(),
                      SizedBox(height: 30.h),
                      themeButton(
                        context: context,
                        textcolor: Colors.white,
                        text: "انتهيت",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: AppColors.primaryColor,
                        width: 353.w,
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildImageContainer() {
  //   double svgWidth = 60.w;
  //   return Container(
  //     height: 85.h,
  //     padding: EdgeInsets.only(right: 20.w),
  //     decoration: BoxDecoration(
  //       color: AppColors.secondaryColor,
  //       borderRadius: BorderRadius.circular(10),
  //       border: Border.all(color: AppColors.buttonColor, width: 0.5),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         Expanded(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               ...truckImages.take(3).map((image) {
  //                 return Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: 4.w),
  //                   child: Image.file(
  //                     File(image),
  //                     width: 60.w,
  //                     height: 60.w,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 );
  //               }),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           // padding: EdgeInsets.all(0.r),
  //           margin: EdgeInsets.all(10.r),
  //           width: 60.w,
  //           height: 70.h,
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //             border: Border.all(color: AppColors.buttonColor, width: 0.5),
  //           ),
  //           child: IconButton(
  //             padding: EdgeInsets.all(0),
  //             onPressed: () {},
  //             icon: SvgPicture.asset("assets/images/Plus.svg"),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildImageContainer() {
    double imageWidth = 60.w;
    return Container(
      height: 85.h,
      padding: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.buttonColor, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child:
                truckImages.isEmpty
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/Image.svg",
                          width: imageWidth,
                        ),
                        SvgPicture.asset(
                          "assets/images/Image.svg",
                          width: imageWidth,
                        ),
                        SvgPicture.asset(
                          "assets/images/Image.svg",
                          width: imageWidth,
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...truckImages.take(3).map((image) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Image.file(
                              File(image.path),
                              width: imageWidth,
                              height: imageWidth,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                      ],
                    ),
          ),

          Container(
            margin: EdgeInsets.all(10.r),
            width: 60.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.buttonColor, width: 0.5),
            ),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () async {
                final picked = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (picked != null) {
                  setState(() {
                    truckImages.add(picked);
                  });
                }
              },
              icon: SvgPicture.asset("assets/images/Plus.svg"),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: 35.h,
        child: TextFormField(
          cursorColor: AppColors.primaryColor,

          style: TextStyle(
            fontSize: 14.r,
            fontFamily: 'tajawal',
            fontWeight: FontWeight.normal,
            color: AppColors.textColor,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.w),
            filled: true,
            fillColor: AppColors.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 35.h,
        child: DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular(5),
          decoration: InputDecoration(
            // labelText: label,
            filled: true,
            fillColor: AppColors.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
