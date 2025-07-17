import 'package:app/presentation/features/truck_owner_register/presentation/addTruck/TruckLicense.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/addTruck/TruckSpecs.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/registerData/OwnerLegalInfo.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/registerData/OwnerPassportPhoto.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/registerData/OwnerTermsAndConditions.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/registerData/OwnerselfiesPhoto.dart';
import 'package:app/presentation/shared/screens/presentation/register_doneScreen.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TruckDriverWelcome extends StatefulWidget {
  bool isFleet;
  TruckDriverWelcome({super.key, this.isFleet = false});

  @override
  State<TruckDriverWelcome> createState() => _TruckDriverWelcomeState();
}

class _TruckDriverWelcomeState extends State<TruckDriverWelcome> {
  List<String> fleetItemsList = [
    "الصورة الشخصية",
    "صورة جواز السفر او البطاقة الشخصية",
    "البيانات القانونية",
    "الشروط والاحكام",
  ];

  List<String> truckItemsList = [
    "الصورة الشخصية",
    "صورة جواز السفر او البطاقة الشخصية",
    "صورة رخصة الشاحنة من الأمام و الخلف",
    "مواصفات الشاحنة",
    "الشروط والاحكام",
  ];
  List<Widget> truckItemsWidgetList = [
    OwnerSelfiephoto(),
    Ownerpassportphoto(),
    TrucklicensePhoto(),
    AddTruckspecs(),
    Ownertermsandconditions(),
  ];
  List<Widget> fleetItemsWidgetList = [
    OwnerSelfiephoto(),
    Ownerpassportphoto(),
    OwnerLegalInfoScreen(),
    Ownertermsandconditions(),
  ];
  List<bool> isDoneFleet = [false, false, false, false];
  List<bool> isDoneTruck = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.screenPadding.w),
        child: SizedBox(
          width: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مرحب بك",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 10.h),
                Text(
                  "يرجي الموافقة وتصوير البيانات التالية",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 40.h),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        widget.isFleet
                            ? fleetItemsList.length
                            : truckItemsList.length,
                    itemBuilder:
                        (context, index) => itemTile(
                          isDone:
                              widget.isFleet
                                  ? isDoneFleet[index]
                                  : isDoneTruck[index],
                          title:
                              widget.isFleet
                                  ? fleetItemsList[index]
                                  : truckItemsList[index],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        widget.isFleet
                                            ? fleetItemsWidgetList[index]
                                            : truckItemsWidgetList[index],
                              ),
                            ).then((_) {
                              setState(() {
                                widget.isFleet
                                    ? isDoneFleet[index] = true
                                    : isDoneTruck[index] = true;
                              });
                            });
                          },
                        ),
                  ),
                ),
                themeButton(
                  context: context,
                  text: "انتهيت",
                  textcolor:
                      widget.isFleet
                          ? (isDoneFleet.every((element) => element)
                              ? Colors.black
                              : Colors.black.withValues(alpha: 0.5))
                          : (isDoneTruck.every((element) => element)
                              ? Colors.black
                              : Colors.black.withValues(alpha: 0.5)),
                  onPressed: () {
                    List<bool> isDone =
                        widget.isFleet ? isDoneFleet : isDoneTruck;

                    if (isDone.every((element) => element)) {
                      for (var element in isDone) {
                        if (element == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("يرجي اكمال جميع البيانات"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterDoneScreen(id: 1),
                            ),
                          );
                        }
                      }
                    }
                  },
                  color:
                      widget.isFleet
                          ? (isDoneFleet.every((element) => element)
                              ? AppColors.secondaryColor
                              : AppColors.secondaryColor.withValues(alpha: 0.5))
                          : (isDoneTruck.every((element) => element)
                              ? AppColors.secondaryColor
                              : AppColors.secondaryColor.withValues(
                                alpha: 0.5,
                              )),
                  width: 353,
                  height: 50,
                ),
                SizedBox(height: 70.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemTile({
    required title,
    required Function() onPressed,
    required bool isDone,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: Colors.black),
            ),
            trailing:
                isDone
                    ? Image.asset("assets/images/done_mark.png")
                    : Icon(Icons.arrow_forward),
          ),
        ),
        Divider(color: AppColors.cardBorderColor),
      ],
    );
  }
}
