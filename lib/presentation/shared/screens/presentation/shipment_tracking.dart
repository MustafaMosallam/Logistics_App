import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShipmentTracking extends StatefulWidget {
  const ShipmentTracking({super.key});

  @override
  State<ShipmentTracking> createState() => _ShipmentTrackingState();
}

class _ShipmentTrackingState extends State<ShipmentTracking> {
  final List<ShipmentTrackingStatus> steps = [
    ShipmentTrackingStatus(
      title: "تم الوصول لمنطقة التحميل",
      timeStamp: "10 ديسمبر، 9:10 صباحاً",
      isCompleted: true,
      hasButton: false,
    ),
    ShipmentTrackingStatus(
      hasButton: true,
      title: "تم تحميل الشحنة واستلام وصل المنشأ",
      timeStamp: "10 ديسمبر، 9:10 صباحاً",
      isCompleted: true,
    ),
    ShipmentTrackingStatus(title: "", timeStamp: "", isCompleted: false),
    ShipmentTrackingStatus(title: "", timeStamp: "", isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: ListView.builder(
              itemCount: steps.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final step = steps[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline + circle + dashed line
                    Column(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange, width: 2),
                            color:
                                step.isCompleted ? Colors.orange : Colors.white,
                          ),
                        ),
                        if (index != steps.length - 1)
                          Container(
                            width: 2,
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.orange,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (step.title.isNotEmpty)
                            Text(
                              step.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          if (step.timeStamp.isNotEmpty)
                            Text(
                              step.timeStamp,
                              style: const TextStyle(color: Colors.grey),
                              textDirection: TextDirection.rtl,
                            ),
                          if (step.hasButton)
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  AppColors.secondaryColor,
                                ),
                                elevation: WidgetStateProperty.all(0),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppConstants.RButtonRadius,
                                    ),
                                  ),
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                width: 129.w,
                                height: 30.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "تحميل شهادة المنشأ",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge?.copyWith(
                                        color: AppColors.buttonColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      child: Image.asset(
                                        "assets/images/Downloadicon.png",
                                        scale: 0.85,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ShipmentTrackingStatus {
  final String title;
  final String timeStamp;
  final bool isCompleted;
  bool hasButton;

  ShipmentTrackingStatus({
    this.hasButton = false,
    required this.title,
    required this.timeStamp,
    required this.isCompleted,
  });
}
