import 'dart:async';

import 'package:app/presentation/features/customer/presentation/homeWithBottomBar.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/TruckOwnerHomeWithBottomBar.dart';
import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterDoneScreen extends StatefulWidget {
  int id;
  RegisterDoneScreen({super.key, required this.id});

  @override
  State<RegisterDoneScreen> createState() => _RegisterDoneScreenState();
}

class _RegisterDoneScreenState extends State<RegisterDoneScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  widget.id == 0
                      ? Homewithbottombar()
                      : (widget.id == 1
                          ? Truckownerhomewithbottombar()
                          : /*Fleetownerhomewithbottombar()*/ Truckownerhomewithbottombar()),
        ),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                size: 100.r,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              "تم انشاء الحساب بنجاح",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
