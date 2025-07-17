import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/presentation/Dirver_Profile_screen.dart';
import 'package:app/presentation/shared/screens/presentation/Drivers_tool_bar.dart';
import 'package:app/presentation/shared/screens/presentation/ShipmentConfirmationScreen.dart';
import 'package:app/presentation/shared/screens/presentation/Shipment_completed.dart';
import 'package:app/presentation/shared/screens/presentation/ShipmentTracking_tool_bar.dart';
import 'package:flutter/material.dart';

enum NotificationStatus {
  newFleetProposed(
    title: "تقدم سائق جديد للشحنة",
    imagePath: "assets/images/SteeringWheel.png",
  ),
  paymentVerificationNeeded(
    title: "يرجى اثبات عملية الدفع",
    imagePath: "assets/images/Ex_mark.png",
  ),
  created(title: "تم انشاء الشحنة بنجاح", imagePath: "assets/images/box.png"),

  started(title: "الشحنة في الطريق", imagePath: "assets/images/truck_grey.png"),
  done(
    title: "تم تسليم الشحنة بنجاح",
    imagePath: "assets/images/done_mark.png",
  );

  void navigateToScreen(BuildContext context) {
    switch (this) {
      case NotificationStatus.newFleetProposed:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DirverProfileScreen(isConfirmed: false),
          ),
        );
        break;
      case NotificationStatus.paymentVerificationNeeded:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ShipmentConfirmationScreen(),
          ),
        );
        break;
      case NotificationStatus.created:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DriversToolBar()),
        );
        break;
      case NotificationStatus.started:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ShipmenttrackingToolBar(),
          ),
        );
        break;
      case NotificationStatus.done:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShipmentCompleted()),
        );
        break;
    }
  }

  final String title;
  final String imagePath;

  const NotificationStatus({required this.title, required this.imagePath});
}

enum ShipmentStatus {
  completed(
    title: "تم تسليم الشحنة",
    color: Colors.green,
    textColor: Colors.white,
  ),
  ongoing(
    title: "الشحنة جارية",
    color: AppColors.primaryColor,
    textColor: Colors.white,
  ),
  billUploadNeeded(
    title: "برجاء رفع إيصال الدفع",
    color: Color.fromARGB(255, 47, 15, 1),
    textColor: Colors.white,
  ),
  billReviewing(
    title: "الايصال قيد المراجعة",
    color: Color.fromARGB(255, 110, 65, 15),
    textColor: Colors.white,
  ),
  waitForTrucks(
    title: "متبقي شاحنات",
    color: Colors.white,
    textColor: Colors.black,
  );

  final String title;
  final Color color;
  final textColor;

  const ShipmentStatus({
    required this.title,
    required this.color,
    required this.textColor,
  });
}
