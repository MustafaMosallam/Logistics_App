import 'package:app/presentation/features/truck_owner_register/presentation/Proposetoshipment/proposalAddDriver.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/TruckCard.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Proposaladdtruck extends StatefulWidget {
  const Proposaladdtruck({super.key});

  @override
  State<Proposaladdtruck> createState() => _ProposaladdtruckState();
}

class _ProposaladdtruckState extends State<Proposaladdtruck> {
  final List<String> registeredDriver = ["مشغول", "متاح", "مشغول", "متاح"];
  final List<String> registeredTruck = ["متاح", "مشغول", "مشغول"];

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Center(
          child: Column(
            children: [
              Text(
                "إختر الشاحنة",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: truckCard(registeredDriver[index]),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50.h),
                child: themeButton(
                  context: context,
                  text: isSelected ? "تم" : "إختر شاحنة",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProposaladdDriver();
                        },
                      ),
                    );
                  },
                  color: AppColors.primaryColor,
                  width: 353.w,
                  height: 63.h,
                  textcolor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
