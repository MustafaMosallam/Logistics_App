import 'package:app/constants/app_constants.dart';
import 'package:app/constants/app_strings.dart';
import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget registerLoginTextField({
  required TextInputType keyboardType,
  TextEditingController? controller,
  required FormFieldValidator<String>? validator,
  required ValueChanged<String> onChanged,
  required String? errorText,
}) {
  return TextFormField(
    onChanged: onChanged,
    textAlign: TextAlign.right,
    controller: controller,
    validator: validator,
    cursorColor: Colors.black,
    keyboardType: keyboardType,
    textAlignVertical: TextAlignVertical.center,
    style: TextStyle(
      fontFamily: AppStrings.mainFont,
      fontSize: 15.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    textDirection: TextDirection.rtl,
    decoration: InputDecoration(
      errorText: errorText,
      // isDense: true,
      fillColor: AppColors.secondaryColor,
      filled: true,

      contentPadding: EdgeInsets.only(top: 0.h, right: 10.w),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.RTextFieldRadius),
        borderSide: BorderSide(color: Colors.white, width: 1.5.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.RTextFieldRadius),
        borderSide: BorderSide(color: Colors.white, width: 1.5.w),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.RTextFieldRadius),
        borderSide: BorderSide(color: Colors.white, width: 0),
      ),
    ),
  );
}
