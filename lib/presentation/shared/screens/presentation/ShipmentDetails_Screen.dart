import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShipmentDetailsScreen extends StatelessWidget {
  const ShipmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "السائقين الموكلين بالشحنة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "الاسم",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("احمد محمد"),
                          SizedBox(height: 8),
                          Text(
                            "رقم الهاتف",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("01007669160"),
                        ],
                      ),
                      ClipRRect(
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
                              size: 60.r,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Page Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                            index == 0
                                ? AppColors.primaryColor
                                : Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 24),

                // Route
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.buttonColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 2.w,
                          height: 30.h,
                          color: Colors.brown,
                        ),
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.brown, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text("مصر، القاهرة", style: TextStyle(fontSize: 18)),
                        SizedBox(height: 15.h),
                        Text(
                          "السعودية، الرياض",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10.h),
                Divider(),
                SizedBox(height: 10.h),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.8,
                  children: const [
                    InfoTile(title: "نوع البضاعة"),
                    InfoTile(title: "مسمى البضاعة"),
                    InfoTile(title: "حالة المادة"),
                    InfoTile(title: "التعبئة"),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(),
                SizedBox(height: 10.h),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.8,
                  children: const [
                    InfoTile(title: "نوع الشاحنة"),
                    InfoTile(title: "وزن الشحنة (طن)"),
                    InfoTile(title: "الشاحنات المتبقية"),
                    InfoTile(title: "السعر المعروض"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  const InfoTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),

          SizedBox(height: 3.h),
          Container(
            width: 117.w,
            height: 29.h,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }
}
