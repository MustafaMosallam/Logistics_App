import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imageSlider(
  List<String> imageUrls,
  Function(int, CarouselPageChangedReason) onChange,
) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 150.0.h,
      autoPlay: false,
      enlargeCenterPage: false,
      viewportFraction: 1,
      onPageChanged: onChange,
    ),
    items:
        imageUrls.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.asset(url, fit: BoxFit.contain),
                ),
              );
            },
          );
        }).toList(),
  );
}

Widget imageSliderIndicator(int length, int currentIndex) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(length, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: index == currentIndex ? AppColors.primaryColor : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor, width: 0),
        ),
      );
    }),
  );
}
