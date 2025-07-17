import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/ImageSlider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirverProfileScreen extends StatefulWidget {
  final bool isConfirmed;
  const DirverProfileScreen({required this.isConfirmed, super.key});

  @override
  State<DirverProfileScreen> createState() => _DirverProfileScreenState();
}

class _DirverProfileScreenState extends State<DirverProfileScreen> {
  List<String> imageUrls = [
    "assets/images/truck1.jpg",
    "assets/images/default_truck.png",
    "assets/images/truck2.jpg",
    "assets/images/truck3.jpg",
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: SafeArea(
          child: Container(
            color: Colors.white,
            height: 50.h,
            // color: Colors.red,
            margin: EdgeInsets.only(
              top: 0.h,
              right: 20.w,
              left: 10.w,
              bottom: 0.h,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: AppConstants.screenPadding.w,
            ),
            child: Center(
              child: Column(
                children: [
                  ClipRRect(
                    child: ClipOval(
                      child: Container(
                        width: 130.r,
                        height: 130.r,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor.withValues(
                            alpha: 0.5,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 80.r,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
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
                    child: Text(
                      "احمد محمد ابراهيم",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontFamily: "Cairo",
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ),
                  if (widget.isConfirmed) ...[
                    SizedBox(height: 10.h),
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
                      child: Text(
                        "011235465879",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          fontFamily: "Cairo",
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: 10.h),

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "214 أ ب د ",
                          textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false,
                          ),
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            fontFamily: "Cairo",
                            color: AppColors.buttonColor,
                          ),
                        ),
                        Text(
                          "شاحنة جوانب",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            fontFamily: "Cairo",
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),

                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "صور الشاحنة",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  imageSlider(imageUrls, _onCarouselUpdate),
                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     height: 150.0.h,
                  //     autoPlay: false,
                  //     enlargeCenterPage: false,
                  //     viewportFraction: 1,
                  //     onPageChanged: _onCarouselUpdate,
                  //   ),
                  //   items:
                  //       imageUrls.map((url) {
                  //         return Builder(
                  //           builder: (BuildContext context) {
                  //             return Container(
                  //               width: MediaQuery.of(context).size.width,
                  //               margin: const EdgeInsets.symmetric(
                  //                 horizontal: 5.0,
                  //               ),
                  //               child: ClipRRect(
                  //                 borderRadius: BorderRadius.circular(5.r),
                  //                 child: Image.asset(url, fit: BoxFit.contain),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       }).toList(),
                  // ),
                  SizedBox(height: 10.h),
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
                  //             index == _currentIndex
                  //                 ? AppColors.primaryColor
                  //                 : Colors.white,
                  //         shape: BoxShape.circle,
                  //         border: Border.all(
                  //           color: AppColors.primaryColor,
                  //           width: 0,
                  //         ),
                  //       ),
                  //     );
                  //   }),
                  // ),
                ],
              ),
            ),
          ),
          if (!widget.isConfirmed)
            Positioned(
              bottom: 50.h,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 120.w,
                      height: 48.h,
                      child: TextButton(
                        onPressed: () {},
                        style: Theme.of(
                          context,
                        ).textButtonTheme.style?.copyWith(
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 162, 63, 6),
                          ),
                        ),
                        child: Text("رفض"),
                      ),
                    ),

                    SizedBox(
                      width: 120.w,
                      height: 48.h,
                      child: TextButton(
                        onPressed: () {},
                        style: Theme.of(context).textButtonTheme.style,
                        child: Text("قبول"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
