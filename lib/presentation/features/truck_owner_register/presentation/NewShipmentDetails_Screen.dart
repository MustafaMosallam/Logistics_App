import 'package:app/presentation/features/truck_owner_register/presentation/Proposetoshipment/proposalAddTruck.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewShipmentDetailsScreen extends StatelessWidget {
  const NewShipmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/box.png", width: 94.w),
                SizedBox(height: 20.h),

                Text(
                  "#SH21408",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 40.h),

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
                SizedBox(height: 50.h),
                themeButton(
                  context: context,
                  text: "تقدم للشحنة",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Proposaladdtruck(),
                      ),
                    );
                  },
                  color: AppColors.primaryColor,
                  width: 353.w,
                  height: 63.h,
                  textcolor: Colors.white,
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
