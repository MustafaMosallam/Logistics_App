import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget _buildtruckData(String text, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(value, style: TextStyle(fontSize: 14, color: AppColors.buttonColor)),
      Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    ],
  );
}

Widget truckCard(String status) {
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
            right: 0.w,
            top: 0.h,
            bottom: 0.h,
          ),
          width: double.infinity,
          height: 120.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildtruckData("شاحنة جوانب", "ا ب ح  125"),
                      _buildtruckData("مقطورة", "ا ب ح  125"),
                      _buildtruckData("حمولة", "10 طن"),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(15),
                ),
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    widthFactor: 0.7, // 👈 Crop top half
                    child: Image.asset(
                      "assets/images/default_truck.png",
                      height: 120.h,
                      fit: BoxFit.cover,
                    ),
                  ),
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
