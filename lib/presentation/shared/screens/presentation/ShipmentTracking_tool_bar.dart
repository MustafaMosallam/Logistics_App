import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/presentation/ShipmentDetails_Screen.dart';
import 'package:app/presentation/shared/screens/presentation/shipment_tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShipmenttrackingToolBar extends StatefulWidget {
  const ShipmenttrackingToolBar({super.key});

  @override
  State<ShipmenttrackingToolBar> createState() =>
      _ShipmenttrackingToolBarState();
}

class _ShipmenttrackingToolBarState extends State<ShipmenttrackingToolBar> {
  int selectedIndex = 0;
  final List<String> tabs = ["بيانات الشحنة", "متابعة الشحنة"];
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

      body: Column(
        children: [
          Container(
            height: 60.h,
            margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
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
                      height: 60.h,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primaryColor : Colors.white,
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

          Expanded(
            child:
                selectedIndex == 0
                    ? ShipmentDetailsScreen() // بيانات الشحنة
                    : ShipmentTracking(), // متابعة الشحنة
          ),
        ],
      ),
    );
  }
}
