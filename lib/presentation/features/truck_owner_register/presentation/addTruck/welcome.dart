import 'package:app/presentation/features/truck_owner_register/presentation/addTruck/TruckLicense.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/addTruck/TruckSpecs.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/addTruck/TruckTermsAndConditions.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/presentation/done_screen.dart';
import 'package:app/presentation/shared/widgets/appBarPreferredSize.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTruckWelcome extends StatefulWidget {
  const AddTruckWelcome({super.key});

  @override
  State<AddTruckWelcome> createState() => _AddTruckWelcomeState();
}

class _AddTruckWelcomeState extends State<AddTruckWelcome> {
  List<String> itemsList = [
    "صورة رخصة الشاحنة من (الامام والخلف)",
    "مواصفات",
    "الشروط والاحكام",
  ];
  List<Widget> itemsWidgetList = [
    TrucklicensePhoto(),
    AddTruckspecs(),
    TruckTermsAndConditions(),
  ];
  List<bool> isDone = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarContainerPreferredSize(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.screenPadding.w),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
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
                        itemCount: itemsList.length,
                        itemBuilder:
                            (context, index) => itemTile(
                              isDone: isDone[index],
                              title: itemsList[index],
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => itemsWidgetList[index],
                                  ),
                                ).then((_) {
                                  setState(() {
                                    isDone[index] = true;
                                  });
                                });
                              },
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 100.h,
              child: themeButton(
                context: context,
                text: "انتهيت",
                textcolor:
                    (isDone.every((element) => element)
                        ? Colors.black
                        : Colors.black.withValues(alpha: 0.5)),

                onPressed: () {
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
                          builder:
                              (context) => DoneScreen(
                                donetext: "تم إنشاء الشاحنة بنجاح",
                              ),
                        ),
                      );
                    }
                  }
                },
                color:
                    (isDone.every((element) => element)
                        ? AppColors.secondaryColor
                        : AppColors.secondaryColor.withValues(alpha: 0.5)),

                width: 150.w,
                height: 53.h,
              ),
            ),
          ],
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
                    ? Image.asset(
                      "assets/images/done_mark.png",
                      width: 20.w,
                      height: 20.h,
                    )
                    : Icon(Icons.arrow_forward),
          ),
        ),
        Divider(color: AppColors.cardBorderColor),
      ],
    );
  }
}
