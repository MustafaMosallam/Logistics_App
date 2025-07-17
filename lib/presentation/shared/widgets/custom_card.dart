import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customCard({
  required String title,
  required String subtitle,
  required Icon icon,
  required BuildContext context,
  required Function() onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Card(
      color: AppColors.backgroundColor,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        height: 150.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall,

                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
            Expanded(child: icon),
          ],
        ),
      ),
    ),
  );
}
