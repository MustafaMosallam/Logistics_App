import 'package:app/presentation/features/truck_owner_register/presentation/addDriver/Driver_register_screen.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/addTruck/welcome.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/presentation/Driver_screen_withData.dart';
import 'package:app/presentation/shared/screens/presentation/TruckInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrucOwnerDriversAndTruckRegistered extends StatefulWidget {
  const TrucOwnerDriversAndTruckRegistered({super.key});

  @override
  State<TrucOwnerDriversAndTruckRegistered> createState() =>
      _TrucOwnerDriversAndTruckRegisteredState();
}

class _TrucOwnerDriversAndTruckRegisteredState
    extends State<TrucOwnerDriversAndTruckRegistered> {
  int selectedIndex = 0;

  final List<String> tabs = ["السائقين المسجلين", "الشاحنات المسجلة"];

  final List<String> registeredDriver = ["مشغول", "متاح", "مشغول", "متاح"];
  final List<String> registeredTruck = ["متاح", "مشغول", "مشغول"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(AppConstants.screenPadding.w),
          child: Column(
            children: [
              Container(
                height: 50.h,
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor),
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
                          padding: const EdgeInsets.symmetric(
                            // vertical: 12,
                            // horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppColors.primaryColor
                                    : Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(index == 0 ? 10.r : 0),
                              right: Radius.circular(index == 0 ? 0 : 10.r),
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
              SizedBox(height: 20.h),

              // Content based on selected tab
              Expanded(
                child: ListView.builder(
                  itemCount:
                      selectedIndex == 0
                          ? registeredDriver.length
                          : registeredTruck.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        selectedIndex == 0
                            ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            DirverWithDataProfileScreen(),
                                  ),
                                );
                              },
                              child: driverCard(registeredDriver[index]),
                            )
                            : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TruckinfoScreen(),
                                  ),
                                );
                              },
                              child: truckCard(registeredTruck[index]),
                            ),
                        SizedBox(height: 10.h),
                      ],
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12.h),
                child:
                    selectedIndex == 0
                        ? _addButton("اضافة سائق", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriverRegisterScreen(),
                            ),
                          );
                        })
                        : _addButton("اضافة شاحنة", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddTruckWelcome(),
                            ),
                          );
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 57.h,
        width: 348.w,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  Widget driverCard(String status) {
    return Card(
      color: AppColors.secondaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 5.h,
              bottom: 5.h,
            ),
            width: 348.w,
            height: 159.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(300),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 22.h),
                    _buildLabeledText("الأسم", "كريم عادل "),
                    SizedBox(
                      width: 120.w,
                      child: Divider(
                        color: AppColors.buttonColor,
                        thickness: 0.5,
                      ),
                    ),
                    _buildLabeledText("رقم الهاتف", "01150587953"),
                    SizedBox(
                      width: 120.w,
                      child: Divider(
                        color: AppColors.buttonColor,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                width: 65.w,
                decoration: BoxDecoration(
                  color:
                      status == "متاح"
                          ? Color.fromARGB(255, 255, 163, 26)
                          : AppColors.buttonColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  status,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget truckCard(String status) {
    return Card(
      color: AppColors.secondaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 5.w,
              right: 0.w,
              top: 0.h,
              bottom: 0.h,
            ),
            width: double.infinity,
            height: 120.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildtruckData("شاحنة جوانب", "ا ب ح  125"),
                        _buildtruckData("مقطورة", "ا ب ح  125"),
                        _buildtruckData("حمولة", "10 طن"),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(15),
                  ),
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      widthFactor: 0.7, // 👈 Crop top half
                      child: Image.asset(
                        "assets/images/default_truck.png",
                        height: 120.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                width: 65.w,
                decoration: BoxDecoration(
                  color:
                      status == "متاح"
                          ? Color.fromARGB(255, 255, 163, 26)
                          : AppColors.buttonColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  status,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabeledText(String label, String value) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 2),
          Text(value, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildtruckData(String text, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 14, color: AppColors.buttonColor),
        ),
        Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
