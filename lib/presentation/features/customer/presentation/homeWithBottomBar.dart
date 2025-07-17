import 'package:app/presentation/features/customer/presentation/customer_home_page.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipment.dart';
import 'package:app/presentation/shared/screens/presentation/shipmentToolBar.dart';
import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Homewithbottombar extends StatefulWidget {
  final int navIndex;
  final int tab;
  const Homewithbottombar({this.tab = 2, this.navIndex = 0, super.key});

  @override
  State<Homewithbottombar> createState() => _HomewithbottombarState();
}

class _HomewithbottombarState extends State<Homewithbottombar> {
  int _selectedIndex = 0;

  List<Widget> get _screens => [
    Customerhomepage(),
    CreateShipment(),
    ShipmentDataScreenToolBar(initialTab: widget.tab),
  ];

  @override
  void initState() {
    _selectedIndex = widget.navIndex;
    super.initState();
  }

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
              color: AppColors.secondaryColor.withValues(alpha: 0.4),
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
                          Icons.add_rounded,
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
                    icon: Icon(
                      LucideIcons.package,
                      size: 30,
                      color:
                          _selectedIndex == 2
                              ? AppColors.primaryColor
                              : Colors.black,
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
