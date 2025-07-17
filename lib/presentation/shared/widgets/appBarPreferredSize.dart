import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget appBarPreferredSize() {
  return PreferredSize(preferredSize: Size.fromHeight(30.h), child: AppBar());
}

PreferredSizeWidget appBarContainerPreferredSize(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.h),
    child: SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20.w), // Horizontal space
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
