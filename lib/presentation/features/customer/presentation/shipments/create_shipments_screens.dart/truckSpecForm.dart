import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/model/fields_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TruckSpecsForm extends ConsumerStatefulWidget {
  const TruckSpecsForm({super.key});

  @override
  ConsumerState<TruckSpecsForm> createState() => _TruckSpecsFormState();
}

class _TruckSpecsFormState extends ConsumerState<TruckSpecsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedTruckType;

  List<String> truckTypes = [
    'شاحنة صغيرة (بيك أب)',
    'شاحنة متوسطة',
    'شاحنة كبيرة',
    'شاحنة تبريد',
    'شاحنة صهريج (لنقل السوائل)',
    'شاحنة نقل سيارات',
    'شاحنة نقل بضائع مسطحة (Flatbed)',
    'شاحنة مغلقة (Box Truck)',
    'شاحنة نقل حاويات (Container Truck)',
    'شاحنة قلّابة (Dump Truck)',
    'شاحنة نقل مواشي',
    'شاحنة نقل مواد خطرة',
    'شاحنة ذات رافعة (Crane Truck)',
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    //  final viewModel = ref.read(fieldsStateProvider.notifier);
    //     final state = ref.watch(fieldsStateProvider);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.screenPadding.w,
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'مواصفات الشاحنة',
                          style: TextStyle(
                            fontSize: 34.r,
                            fontFamily: 'tajawal',
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text("نوع الشاحنة", style: titleLarge),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          // color: Colors.red,
                          height: 45.h,
                          child: DropdownButtonFormField<String>(
                            value: selectedTruckType,
                            borderRadius: BorderRadius.circular(5),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Cairo',
                              height: 1.h,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonColor,
                            ),
                            dropdownColor: Colors.white,
                            menuMaxHeight: 200,
                            decoration: InputDecoration(
                              isDense: true,
                              // labelText: label,
                              filled: true,

                              fillColor: AppColors.secondaryColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            items:
                                truckTypes
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedTruckType = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),

                      Text("عدد الشاحنات", style: titleLarge),
                      SizedBox(height: 3.h),
                      buildTextField(),
                      SizedBox(height: 240.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: 45.h,
        child: TextFormField(
          cursorColor: AppColors.primaryColor,

          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'Cairo',
            // height: 1.5,
            fontWeight: FontWeight.w500,
            color: AppColors.buttonColor,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.w),
            filled: true,
            fillColor: AppColors.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 35.h,
        child: DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular(5),
          decoration: InputDecoration(
            // labelText: label,
            filled: true,
            fillColor: AppColors.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
