import 'package:app/constants/app_constants.dart';
import 'package:app/presentation/shared/screens/models/shipment_status.dart';
import 'package:app/presentation/shared/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationStatus> shipmentStatusList = [
    NotificationStatus.newFleetProposed,
    NotificationStatus.paymentVerificationNeeded,
    NotificationStatus.created,
    NotificationStatus.started,
    NotificationStatus.done,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: SafeArea(
          bottom: false,
          child: Container(
            height: 100.h,
            // color: Colors.red,
            margin: EdgeInsets.only(bottom: 20.h, left: 20.h, right: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: 25.r),
                ),
                Text(
                  'الإشعارات',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.screenPadding.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // SizedBox(height: 0.h),
              Expanded(
                child: ListView.builder(
                  itemCount: shipmentStatusList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        notificationCard(
                          context: context,
                          status: shipmentStatusList[index],
                        ),
                        SizedBox(height: 8.h),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
