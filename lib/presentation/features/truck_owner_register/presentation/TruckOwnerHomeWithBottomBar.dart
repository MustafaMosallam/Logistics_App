import 'package:app/presentation/shared/screens/presentation/shipmentToolBar.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/TruckOwnerDriverAndTruckRegistered.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/TruckOwnerHomePage.dart';
import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Truckownerhomewithbottombar extends StatefulWidget {
  const Truckownerhomewithbottombar({super.key});

  @override
  State<Truckownerhomewithbottombar> createState() =>
      _TruckownerhomewithbottombarState();
}

class _TruckownerhomewithbottombarState
    extends State<Truckownerhomewithbottombar> {
  int _selectedIndex = 0;

  List<Widget> get _screens => [
    Truckownerhomepage(),
    ShipmentDataScreenToolBar(isTruckOwner: true),
    TrucOwnerDriversAndTruckRegistered(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 30.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Container(
              height: 90.h,
              color: AppColors.secondaryColor.withValues(alpha: 0.26),
              // padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      LucideIcons.home,
                      size: 30,
                      color:
                          _selectedIndex == 0
                              ? AppColors.primaryColor
                              : Colors.black,
                    ),
                    onPressed: () => _onItemTapped(0),
                  ),

                  Material(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () => _onItemTapped(1),
                      child: Container(
                        height: 70,
                        width: 70,
                        alignment: Alignment.center,
                        child: Icon(
                          LucideIcons.package,
                          size: 50,
                          color:
                              _selectedIndex == 1
                                  ? AppColors.primaryColor
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/Steer.svg',
                      width: 32,
                      height: 32,

                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 2
                            ? AppColors.primaryColor
                            : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () {
                      _onItemTapped(2);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
