import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/presentation/done_screen.dart';
import 'package:app/presentation/shared/widgets/DriverCard.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProposaladdDriver extends StatefulWidget {
  const ProposaladdDriver({super.key});

  @override
  State<ProposaladdDriver> createState() => _ProposaladdDriverState();
}

class _ProposaladdDriverState extends State<ProposaladdDriver> {
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
                "إختر السائق",
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
                      child: driverCard(registeredDriver[index]),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50.h),
                child: themeButton(
                  context: context,
                  text: isSelected ? "تم" : "إختر سائق",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DoneScreen(donetext: "تم التقديم علي الشحنة");
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
