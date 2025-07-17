import 'dart:developer';

import 'package:app/constants/api_path.dart';
import 'package:app/presentation/features/auth/register/user_model.dart';
import 'package:app/presentation/features/customer/presentation/homeWithBottomBar.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/model/shipments_model.dart';
import 'package:app/presentation/shared/screens/presentation/notifications_screen.dart';
import 'package:app/presentation/shared/screens/presentation/profile_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
// import 'package:lucide_icons/lucide_icons.dart';

class Customerhomepage extends ConsumerStatefulWidget {
  const Customerhomepage({super.key});

  @override
  ConsumerState<Customerhomepage> createState() => _CustomerhomepageState();
}

class _CustomerhomepageState extends ConsumerState<Customerhomepage> {
  final List<String> onGoingShipments = [""];
  final List<String> pendingShipments = ["", "", ""];
  bool isLoading = false;
  String? errorMessage;
  final Dio _dio = Dio();
  List<Shipment> shipments = [];
  Future<void> getshipments() async {
    try {
      final response = await _dio.get(
        ApiPath.shipment,
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NjllMjgzZjFhMmRlMjNlNzk5NjUzYiIsImlhdCI6MTc1MjAzMjE2NSwiZXhwIjoxNzU0NjI0MTY1fQ.inV8FVSkDgCR-YI4-T11TGrbVBB3lOKxveoXi6hBP38",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final shipmentsJson = response.data["data"]["shipments"];

        if (shipmentsJson != null && shipmentsJson is List) {
          List<Shipment> shipments =
              shipmentsJson
                  .map<Shipment>((json) => Shipment.fromJson(json))
                  .toList();
          for (var shipment in shipments) {
            log("Shipment ID: ${shipment.id}");
          }

          setState(() {
            this.shipments = shipments;
            errorMessage = null;
          });
        } else {
          setState(() {
            errorMessage = "لا يوجد شحنات لعرضها";
          });
        }
      } else {
        setState(() {
          errorMessage = "حدث خطأ أثناء تحميل الشحنات";
        });
      }
    } catch (e) {
      log("error: $e");
      setState(() {
        errorMessage = "فشل الاتصال بالخادم: ${e.toString()}";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getshipments();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    // print(MediaQuery.of(context).size.height);

    final state = ref.watch(authenticatedUserProvider);
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.screenPadding.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      state!.name,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      " مرحبا",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                Container(
                  height: 137.h,
                  width: 353.w,
                  padding: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.cardBorderColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/truck.png",
                        // width: 183.w,
                        // height: 137.h,
                        scale: 1.2.r,
                      ),
                      Text(
                        "دائما معك في\nالطريق",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),

                // SizedBox(height: 10.h),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Homewithbottombar(navIndex: 2, tab: 0),
                        // ShipmentDataScreenToolBar(initialTab: 0),
                      ),
                    );
                  },
                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    overlayColor: WidgetStateProperty.all(Colors.grey[100]),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.r)),
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 0.h),
                    alignment: Alignment.bottomCenter,
                    // color: Colors.red,
                    height: 40.h,
                    // margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back, size: 20.r, color: Colors.black),
                        Text(
                          "الشحنات الجارية",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      AppConstants.cardRadius,
                    ),
                    border: Border.all(color: AppColors.cardBorderColor),
                  ),
                  height: 160.h,
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "لا يوجد شحنات جارية",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  // ListView.builder(
                  //   itemCount: onGoingShipments.length,
                  //   itemBuilder: (context, index) {
                  //     return homePageOnGoingShipmentCard(
                  //       "القاهرة",
                  //       "بغداد",
                  //       50,
                  //       "SH15325",
                  //     );
                  //   },
                  // ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Homewithbottombar(navIndex: 2, tab: 2),
                        // ShipmentDataScreenToolBar(initialTab: 2),
                      ),
                    );
                  },
                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    overlayColor: WidgetStateProperty.all(Colors.grey[100]),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.r)),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 40.h,
                    // color: Colors.red,
                    padding: EdgeInsets.only(bottom: 0.h),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back, size: 20.r, color: Colors.black),
                        Text(
                          "الشحنات المعلقة",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstants.cardRadius,
                    ),
                  ),
                  height: 150.h,
                  child:
                      (shipments.isNotEmpty)
                          ? ListView.builder(
                            itemCount: shipments.length,
                            itemBuilder: (context, index) {
                              final shipment = shipments[index];
                              return Column(
                                children: [
                                  homePagePendingShipmentCard(
                                    shipment.origin.address,
                                    shipment.destination.address,
                                    50,
                                    shipment.id,
                                  ),
                                  Divider(
                                    indent: 30,
                                    endIndent: 30,
                                    color: AppColors.buttonColor.withAlpha(80),
                                  ),
                                ],
                              );
                            },
                          )
                          : SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                "لا يوجد شحنات معلقة",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 20,
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
    );
  }

  Widget homePageOnGoingShipmentCard(
    String begin,
    String end,
    int progress,
    String id,
  ) {
    return Card(
      shadowColor: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          height: 140.h,
          width: 353.w,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Text(
                        id,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                      ),

                      Row(
                        children: [
                          Text(
                            begin,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ), // source

                          SizedBox(width: 5.w),
                          Icon(Icons.arrow_forward),
                          SizedBox(width: 5.w),

                          Text(
                            end,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ), //destination
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 70.w),

                  SizedBox(
                    // color: Colors.red,
                    width: 80.w,
                    // height: 80.h,
                    child: Lottie.asset("assets/animations/truck.json"),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Text(
                    "${progress.toString()}%",
                    style: TextStyle(
                      fontSize: 14.r,
                      fontFamily: 'tajawal',
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
              LinearProgressIndicator(
                minHeight: 13.h,
                borderRadius: BorderRadius.circular(30),
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primaryColor,
                ),
                value: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homePagePendingShipmentCard(
    String begin,
    String end,
    int progress,
    String id,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 0.w, bottom: 10.h, right: 20.w, left: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.cardRadius),
              color: Colors.white,
            ),
            child: Text("إنتظار الدفع"),
          ),
          Row(
            children: [
              Text(
                end,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15,
                  color: AppColors.primaryColor,
                ),
              ), // destination
              SizedBox(width: 5.w),
              Icon(Icons.arrow_back),
              SizedBox(width: 5.w),
              Text(
                begin,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 15),
              ), // source
            ],
          ),
        ],
      ),
    );
  }
}
