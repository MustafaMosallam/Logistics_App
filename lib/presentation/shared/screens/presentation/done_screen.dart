import 'dart:async';

import 'package:app/presentation/features/customer/presentation/homeWithBottomBar.dart';
import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoneScreen extends StatefulWidget {
  final String donetext;
  final bool home;
  const DoneScreen({this.home = false, super.key, required this.donetext});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      if (widget.home) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homewithbottombar()),
          (route) => false,
        );
      } else {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
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
              widget.donetext,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
