import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/ImageSlider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TruckinfoScreen extends StatefulWidget {
  const TruckinfoScreen({super.key});

  @override
  State<TruckinfoScreen> createState() => _TruckinfoScreenState();
}

class _TruckinfoScreenState extends State<TruckinfoScreen> {
  List<String> imageUrls = [
    "assets/images/truck1.jpg",
    "assets/images/default_truck.png",
    "assets/images/truck2.jpg",
  ];
  int _currentIndex = 0;

  void _onCarouselUpdate(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            bottom: 0.h,
            right: AppConstants.screenPadding.w,
            left: AppConstants.screenPadding.w,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  imageSlider(imageUrls, _onCarouselUpdate),
                  SizedBox(height: 20.h),
                  imageSliderIndicator(imageUrls.length, _currentIndex),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: List.generate(imageUrls.length, (index) {
                  //     return Container(
                  //       margin: const EdgeInsets.symmetric(horizontal: 4),
                  //       width: 8,
                  //       height: 8,
                  //       decoration: BoxDecoration(
                  //         color:
                  //             index == 0
                  //                 ? AppColors.primaryColor
                  //                 : Colors.grey[300],
                  //         shape: BoxShape.circle,
                  //       ),
                  //     );
                  //   }),
                  // ),
                  SizedBox(height: 20.h),

                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _buildtruckData("شاحنة جوانب", "ا ب  ح"),
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _buildtruckData("مقطورة", "ع غ س"),
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _buildtruckData("حمولة", "10 طن"),
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "صورة رخصة الشاحنة",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Image.asset("assets/images/Carlicense.png", scale: 1.3),
                  SizedBox(height: 150.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildtruckData(String text, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontFamily: "Cairo",
            color: AppColors.buttonColor,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontFamily: "Cairo",
            color: AppColors.buttonColor,
          ),
        ),
      ],
    );
  }
}
