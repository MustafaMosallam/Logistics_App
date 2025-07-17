import 'package:app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget themeButton({
  required BuildContext context,
  required String text,
  required VoidCallback onPressed,
  required Color color,
  required double width,
  required double height,
  required Color textcolor,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(color),
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.RButtonRadius),
        ),
      ),
    ),
    child: Container(
      alignment: Alignment.center,
      width: width.w,
      height: height.h,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: textcolor,
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
