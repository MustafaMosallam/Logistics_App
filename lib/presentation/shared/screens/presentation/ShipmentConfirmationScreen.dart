import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShipmentConfirmationScreen extends StatelessWidget {
  const ShipmentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: SafeArea(
          bottom: false,
          child: Container(
            height: 100.h,
            // color: Colors.red,
            margin: EdgeInsets.only(bottom: 20.h, left: 20.h, right: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: 25.r),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 50.h),
                  Text(
                    "#SH21408",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "حالة الشحنة: ",
                            style: Theme.of(
                              context,
                            ).textTheme.headlineLarge?.copyWith(
                              // fontSize: 20.sp,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "معلقة",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineLarge?.copyWith(
                                  // fontSize: 20.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "• يرجى كتابة رقم الإيداع أو التحويل\n• ورفع صورة الإيداع أو التحويل",
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(fontSize: 14.sp),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "رقم الإيداع او التحويل",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "يرجى تصوير ورفع ورقة الإيداع",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Icon(Icons.upload, color: Colors.brown),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: 353.w,
              child: themeButton(
                context: context,
                text: "تأكيد",
                onPressed: () {},
                color: AppColors.buttonColor,
                width: 353.w,
                height: 53.h,
                textcolor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
