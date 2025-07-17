import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TruckTermsAndConditions extends StatefulWidget {
  const TruckTermsAndConditions({super.key});

  @override
  State<TruckTermsAndConditions> createState() =>
      _TruckTermsAndConditionsState();
}

class _TruckTermsAndConditionsState extends State<TruckTermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.screenPadding.w),
        child: SizedBox(
          width: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "الشروط والأحكام",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "يرجي الموافقة على الشروط والأحكام التالية",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 40.h),

                      Text(
                        "1. واجه الكاميرا مباشرة مع التأكد من وضوح   العينين والفم",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          wordSpacing: 7,
                          fontWeight: FontWeight.bold,
                          fontFamily: "tajawal",
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "2. تأكد من أن الصورة مضاءة جيدًا، خالية من الوهج، وواضحة التركيز",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          wordSpacing: 7,
                          fontWeight: FontWeight.bold,
                          fontFamily: "tajawal",
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "2. تأكد من أن الصورة مضاءة جيدًا، خالية من الوهج، وواضحة التركيز",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          wordSpacing: 7,
                          fontWeight: FontWeight.bold,
                          fontFamily: "tajawal",
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "2. تأكد من أن الصورة مضاءة جيدًا، خالية من الوهج، وواضحة التركيز",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          wordSpacing: 7,
                          fontWeight: FontWeight.bold,
                          fontFamily: "tajawal",
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "2. تأكد من أن الصورة مضاءة جيدًا، خالية من الوهج، وواضحة التركيز",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          wordSpacing: 7,
                          fontWeight: FontWeight.bold,
                          fontFamily: "tajawal",
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "2. تأكد من أن الصورة مضاءة جيدًا، خالية من الوهج، وواضحة التركيز",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          wordSpacing: 7,
                          fontWeight: FontWeight.bold,
                          fontFamily: "tajawal",
                        ),
                      ),
                    ],
                  ),
                ),
                themeButton(
                  context: context,
                  text: "أوافق",
                  textcolor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: AppColors.buttonColor,
                  width: 353.w,
                  height: 55.h,
                ),
                SizedBox(height: 70.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
