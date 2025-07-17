import 'dart:developer';

import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/LegalInfo.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/model/fields_viewmodel.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/price_quote_form.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/RecipientInfoForm.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/SenderInfoForm.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/cargoDescriptionForm.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/truckSpecForm.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateShipment extends ConsumerStatefulWidget {
  const CreateShipment({super.key});

  @override
  ConsumerState<CreateShipment> createState() => _CreateShipmentState();
}

class _CreateShipmentState extends ConsumerState<CreateShipment> {
  int _currentStep = 0;

  List<Widget> steps = [
    SenderInfoForm(),
    RecipientInfoForm(),
    CargoInfoForm(),
    TruckSpecsForm(),
    Pricequoteform(),
    LegalInfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(fieldsStateProvider.notifier);
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
              left: 20.w,
              bottom: 0.h,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (_currentStep != 0)
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      if (_currentStep > 0) {
                        setState(() {
                          _currentStep--;
                        });
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            steps[_currentStep],

            SizedBox(height: 40.h),
            Container(
              margin: EdgeInsets.only(top: 0.h),
              child:
                  _currentStep <= 3
                      ? themeButton(
                        context: context,
                        text: "التالي",
                        onPressed: () {
                          if (_currentStep < 3) {
                            var state = ref.watch(fieldsStateProvider);
                            log("isvalid:${state.isValid}");

                            if (state.isValid) {
                              viewModel.resetState();
                              setState(() {
                                _currentStep++;
                              });
                              viewModel.resetState();
                              state = ref.watch(fieldsStateProvider);
                            }
                          } else {
                            setState(() {
                              _currentStep++;
                            });
                          }
                        },
                        color: AppColors.secondaryColor,
                        width: 150.w,
                        height: 53.h,
                        textcolor: Colors.black,
                      )
                      : null,
            ),
            SizedBox(height: 10.h),
          ],
        ),

        // ),
      ),
    );
  }
}
