import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/models/shipment_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget notificationCard({
  required BuildContext context,
  required NotificationStatus status,
}) {
  return GestureDetector(
    onTap: () {
      status.navigateToScreen(context);
    },
    child: Card(
      color: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        height: 70.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("SH-1020", style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "بغداد",
                      style: TextStyle(
                        fontSize: 12.r,
                        fontFamily: 'tajawal',
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryColor,
                      ),
                    ), // destination
                    SizedBox(width: 5.w),
                    Icon(Icons.arrow_back),
                    SizedBox(width: 5.w),
                    Text(
                      "القاهرة",
                      style: TextStyle(
                        fontSize: 12.r,
                        fontFamily: 'tajawal',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ), // source
                  ],
                ),
                Text(
                  status.title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Image.asset(status.imagePath, width: 40.w, height: 40.h),
          ],
        ),
      ),
    ),
  );
}
