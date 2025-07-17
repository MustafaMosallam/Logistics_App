import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/presentation/Dirver_Profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget driverCard({
      required String name,
      required String phone,
      required String truckType,
      required String truckNumber,
      required Icon statusIcon,
      required bool isAccepted,
    }) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => DirverProfileScreen(isConfirmed: isAccepted),
            ),
          );
        },
        child: Card(
          elevation: 0,
          color: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: AppColors.cardBorderColor),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: 250.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor:
                                isAccepted
                                    ? AppColors.primaryColor
                                    : AppColors.buttonColor,
                            child: statusIcon,
                          ),

                          Row(
                            children: [
                              Text(
                                "عرض بقية التفاصيل",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(fontSize: 10.sp),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 20.r,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 100.h),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 16,
                          childAspectRatio: 2.5,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _driverInfoRow("الاسم", name),
                            _driverInfoRow("رقم الهاتف", "xxxxxxxxxxx"),
                            _driverInfoRow("نوع الشاحنة", truckType),
                            _driverInfoRow("رقم الشاحنة", truckNumber),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 15.h,
                    child: ClipRRect(
                      child: ClipOval(
                        child: Container(
                          width: 90.r,
                          height: 90.r,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 70.r,
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
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 25.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "السائقين المقبولين",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    driverCard(
                      name: "أحمد محمد",
                      phone: "xxxxxxxxxxx",
                      truckType: "شاحنة جوانب",
                      truckNumber: "xxxxxxxxxxx",

                      statusIcon: const Icon(
                        Icons.check_rounded,

                        color: Colors.white,
                        size: 15,
                      ),
                      isAccepted: true,
                    ),
                    driverCard(
                      name: "أحمد محمد",
                      phone: "xxxxxxxxxxx",
                      truckType: "شاحنة جوانب",
                      truckNumber: "xxxxxxxxxxx",

                      statusIcon: const Icon(
                        Icons.check_rounded,

                        color: Colors.white,
                        size: 15,
                      ),
                      isAccepted: true,
                    ),

                    const SizedBox(height: 16),
                    Text(
                      "السائقين المتقدمين",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(color: Colors.black),
                    ),
                    driverCard(
                      name: "أحمد محمد",
                      phone: "xxxxxxxxxxx",
                      truckType: "شاحنة جوانب",
                      truckNumber: "xxxxxxxxxxx",
                      statusIcon: const Icon(
                        Icons.question_mark_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                      isAccepted: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _driverInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, textAlign: TextAlign.right),
          const Divider(thickness: 1),
        ],
      ),
      // child: Row(
      //   children: [
      //     Expanded(
      //       child: Text(
      //         title,
      //         style: const TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     Expanded(child: Text(value, textAlign: TextAlign.right)),
      //   ],
      // ),
    );
  }
}
