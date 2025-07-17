import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget _buildLabeledText(String label, String value) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 2),
        Text(value, style: TextStyle(fontSize: 14)),
      ],
    ),
  );
}

Widget driverCard(String status) {
  return Card(
    color: AppColors.secondaryColor,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 5.w,
            right: 20.w,
            top: 5.h,
            bottom: 5.h,
          ),
          width: 348.w,
          height: 159.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: ClipOval(
                  child: Container(
                    width: 125.r,
                    height: 125.r,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 90.r, // Adjust size as needed
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 30.h),
                    _buildLabeledText("الأسم", "كريم عادل "),
                    SizedBox(
                      width: 120.w,
                      child: Divider(
                        color: AppColors.buttonColor,
                        thickness: 0.5,
                      ),
                    ),
                    _buildLabeledText("رقم الهاتف", "01150587953"),
                    SizedBox(
                      width: 120.w,
                      child: Divider(
                        color: AppColors.buttonColor,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
              width: 65.w,
              decoration: BoxDecoration(
                color:
                    status == "متاح"
                        ? Color.fromARGB(255, 255, 163, 26)
                        : AppColors.buttonColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                status,
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
