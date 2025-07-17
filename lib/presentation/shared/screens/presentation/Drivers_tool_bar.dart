import 'package:app/presentation/shared/screens/presentation/Shipment_Drivers_screen.dart';
import 'package:app/presentation/shared/screens/presentation/Shipment_Pending_Details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriversToolBar extends StatefulWidget {
  const DriversToolBar({super.key});

  @override
  State<DriversToolBar> createState() => _DriversToolBarState();
}

class _DriversToolBarState extends State<DriversToolBar> {
  int selectedIndex = 0;
  final List<String> tabs = ["السائقين", "بيانات الشحنة"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: SafeArea(
          child: Container(
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

      //  PreferredSize(
      //   preferredSize: Size.fromHeight(35.h),
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         SizedBox(width: 20.w),
      //         Align(
      //           alignment: Alignment.bottomCenter,
      //           child: IconButton(
      //             icon: Icon(Icons.arrow_back),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            // Top tab bar
            Container(
              margin: EdgeInsets.only(bottom: 16.h, right: 16.w, left: 16.w),
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.shade300),
              ),
              child: Row(
                children: List.generate(tabs.length, (index) {
                  final isSelected = selectedIndex == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 50.h,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange : Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(index == 0 ? 10 : 0),
                            right: Radius.circular(index == 0 ? 0 : 10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            tabs[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Content based on selected tab
            Expanded(
              child:
                  selectedIndex == 0
                      ? DriversScreen() // بيانات الشحنة
                      : ShipmentPendingDetailsScreen(), // متابعة الشحنة
            ),
          ],
        ),
      ),
    );
  }
}
