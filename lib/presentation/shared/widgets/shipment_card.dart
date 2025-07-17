import 'package:app/presentation/features/truck_owner_register/presentation/NewShipmentDetails_Screen.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/models/shipment_status.dart';
import 'package:app/presentation/shared/screens/presentation/Drivers_tool_bar.dart';
import 'package:app/presentation/shared/screens/presentation/Shipment_completed.dart';
import 'package:app/presentation/shared/screens/presentation/ShipmentTracking_tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShipmentCard extends StatelessWidget {
  IconData icon;
  ShipmentStatus status;
  int id;
  bool isNew = false;
  bool isOngoing;
  String fromCountry;
  String fromCity;
  String toCountry;
  String toCity;
  String date;
  String shipmentId;

  ShipmentCard({
    required this.date,
    required this.fromCountry,
    required this.fromCity,
    required this.toCountry,
    required this.toCity,
    required this.shipmentId,
    this.isOngoing = true,
    required this.isNew,
    required this.id,
    required this.status,
    required this.icon,
    required,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          if (id == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        isNew
                            ? NewShipmentDetailsScreen()
                            : const ShipmenttrackingToolBar(),
              ),
            );
          } else if (id == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShipmentCompleted(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DriversToolBar()),
            );
          }
        },
        child: Card(
          color: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: AppColors.cardBorderColor),
          ),
          elevation: 0,
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        // color: status.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:
                          isNew
                              ? Text(
                                // status.title,
                                "SH465854",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                              : Container(
                                padding: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                  color: status.color,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  status.title,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(color: status.textColor),
                                ),
                              ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (id == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      isNew
                                          ? NewShipmentDetailsScreen()
                                          : const ShipmenttrackingToolBar(),
                            ),
                          );
                        } else if (id == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ShipmentCompleted(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriversToolBar(),
                            ),
                          );
                        }
                      },
                      child: Row(
                        children: [
                          isNew
                              ? Text(
                                "المزيد من التفاصيل",
                                style: TextStyle(fontSize: 12.sp),
                              )
                              : Text(
                                shipmentId,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          SizedBox(width: 6.w),
                          const Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("نوع الشاحنة", style: TextStyle(fontSize: 14.sp)),
                    Row(
                      children: [
                        Text(
                          "حاويات جانبية",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        // SizedBox(width: 8.w),
                        // const Text("–"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("بدأت الشحنة بيوم", style: TextStyle(fontSize: 14.sp)),
                    Row(
                      children: [
                        Text(date, style: TextStyle(fontSize: 14.sp)),
                        // SizedBox(width: 8.w),
                        // const Text("–"),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "20158",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " ج.م",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isOngoing
                        ? SizedBox(
                          height: 6.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: 0.6,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primaryColor,
                              ),
                            ),
                          ),
                        )
                        : progressLine(),

                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "من",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "إلي",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$fromCountry, $fromCity",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$toCountry, $toCity",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget progressLine() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Line
        Container(
          height: 2,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          color: Colors.orange,
        ),
        // Row with circles
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.orange, width: 2),
                ),
              ),
            ),
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.orange, width: 2),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
