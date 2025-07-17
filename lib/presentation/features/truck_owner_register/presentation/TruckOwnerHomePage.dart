import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/models/shipment_status.dart';
import 'package:app/presentation/shared/screens/presentation/notifications_screen.dart';
import 'package:app/presentation/shared/screens/presentation/profile_screen.dart';
import 'package:app/presentation/shared/widgets/shipment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Truckownerhomepage extends StatefulWidget {
  const Truckownerhomepage({super.key});

  @override
  State<Truckownerhomepage> createState() => _TruckownerhomepageState();
}

class _TruckownerhomepageState extends State<Truckownerhomepage> {
  String? selectedCountry;
  String? selectedCity;
  String? selectedPhoneCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: SafeArea(
          bottom: false,
          child: Container(
            // color: Colors.red,
            height: 70.h,
            margin: EdgeInsets.only(
              right: 20.w,
              left: 20.w,
              bottom: 10.h,
              top: 0.h,
            ),
            // color: Colors.red,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  // padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withAlpha(76),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.notifications_active_outlined,
                      size: 25.r,
                    ),
                  ),
                ),
                ClipRRect(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile()),
                      );
                    },
                    child: ClipOval(
                      child: Container(
                        width: 50.r,
                        height: 50.r,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor.withValues(
                            alpha: 0.5,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 35.r,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // PreferredSize(
      //   preferredSize: Size.fromHeight(100.h),
      //   child: SafeArea(
      //     child: Container(
      //       margin: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.h),
      //       // color: Colors.red,
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             width: 50,
      //             height: 50,
      //             decoration: BoxDecoration(
      //               color: AppColors.secondaryColor.withAlpha(76),
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: GestureDetector(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => const NotificationsScreen(),
      //                   ),
      //                 );
      //               },
      //               child: Icon(Icons.notifications_active_outlined, size: 25),
      //             ),
      //           ),

      //           ClipRRect(
      //             child: GestureDetector(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(builder: (context) => UserProfile()),
      //                 );
      //               },
      //               child: ClipOval(
      //                 child: Container(
      //                   width: 40.r,
      //                   height: 40.r,
      //                   decoration: BoxDecoration(
      //                     color: AppColors.secondaryColor.withValues(
      //                       alpha: 0.5,
      //                     ),
      //                     shape: BoxShape.circle,
      //                   ),
      //                   child: Icon(
      //                     Icons.person,
      //                     size: 25.r,
      //                     color: Colors.grey,
      //                   ),
      //                 ),
      //               ),
      //               //  Image.asset(
      //               //   "assets/images/prof.jpg",
      //               //   width: 50,
      //               //   height: 50,
      //               // ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.screenPadding.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "مرحبا احمد محمد",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 20.h),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          // height: 137.h,
                          width: 353.w,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // color: AppColors.secondaryColor.withValues(
                            //   alpha: 0.45,
                            // ),
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(
                            //   color: AppColors.cardBorderColor,
                            // ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "من: ",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                    child: buildDropdownField(
                                      ["مصر", "الأردن"],
                                      (value) {
                                        setState(() => selectedCountry = value);
                                      },
                                      "مصر",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                    child: buildDropdownField(
                                      ["القاهرة", "الشرقية"],
                                      (value) {
                                        setState(() => selectedCity = value);
                                      },
                                      "القاهرة",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "إلى: ",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                    child: buildDropdownField(
                                      ["السعودية", "الأردن"],
                                      (value) {
                                        setState(() => selectedCountry = value);
                                      },
                                      "السعودية",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                    child: buildDropdownField(
                                      ["الرياض", "الشرقية"],
                                      (value) {
                                        setState(() => selectedCity = value);
                                      },
                                      "الرياض",
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 18.h),
                                // height: 100.h,
                                // color: Colors.red,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "يوم: ",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge
                                          ?.copyWith(color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 251.w,
                                      // height: 90.h,
                                      // color: Colors.amber,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildDateBox("8", 60.w),
                                          SizedBox(width: 7.w),
                                          _buildSeparator(),
                                          SizedBox(width: 7.w),
                                          _buildDateBox("12", 60.w),
                                          SizedBox(width: 7.w),
                                          _buildSeparator(),
                                          SizedBox(width: 7.w),
                                          _buildDateBox("2024", 70.w),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.all(0),
                                  ),
                                  elevation: WidgetStatePropertyAll(0),
                                  backgroundColor: WidgetStatePropertyAll(
                                    AppColors.secondaryColor,
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 3.h,
                                    left: 10.w,
                                  ),
                                  alignment: Alignment.center,
                                  width: 251.w,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(
                                          Icons.arrow_downward,
                                          size: 20,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "نوع الشاحنة",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black.withValues(
                                              alpha: 0.7,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      // ShipmentCard(
                      //   isOngoing: false,
                      //   isNew: true,
                      //   id: 0,
                      //   status: ShipmentStatus.ongoing,
                      //   icon: Icons.add,
                      // ),
                      SizedBox(height: 0.h),
                      // ShipmentCard(
                      //   isOngoing: false,
                      //   isNew: true,
                      //   id: 0,
                      //   status: ShipmentStatus.ongoing,
                      //   icon: Icons.add,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateBox(String text, double width) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: 30.h,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(
            height: 1.8,
            fontSize: 22.sp,
            color: AppColors.buttonColor,
          ),
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Transform.rotate(
        angle: 20 * 3.1415926535 / 180,
        child: Container(
          width: 1.5,
          height: 20,
          color: Color.fromRGBO(47, 15, 1, 0.2), // Subtle gray line
        ),
      ),
    );
  }

  Widget buildDropdownField(
    List<String> items,
    Function(String?) onChanged,
    String label,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        // color: Colors.red,
        height: 50.h,
        width: 35.w,
        child: DropdownButtonFormField<String>(
          dropdownColor: Colors.white,
          padding: EdgeInsets.all(0),
          value: label,
          borderRadius: BorderRadius.circular(10),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
