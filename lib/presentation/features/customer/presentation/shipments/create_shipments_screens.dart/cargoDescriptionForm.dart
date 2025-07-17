import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/model/fields_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CargoInfoForm extends ConsumerStatefulWidget {
  const CargoInfoForm({super.key});

  @override
  ConsumerState<CargoInfoForm> createState() => _CargoInfoFormState();
}

class _CargoInfoFormState extends ConsumerState<CargoInfoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> goodsTypes = [
    'مواد غذائية',
    'أجهزة إلكترونية',
    'ملابس',
    'أثاث منزلي',
    'مواد بناء',
    'معدات صناعية',
    'منتجات طبية',
    'قطع غيار سيارات',
    'كتب ومطبوعات',
    'منتجات تجميل',
    'منتجات زراعية',
    'ألعاب أطفال',
    'مواد كيميائية',
    'أجهزة كهربائية',
    'حيوانات حية',
    'منتجات تنظيف',
  ];
  List<String> materialConditions = [
    'جديدة',
    'مستعملة',
    'قابلة للكسر',
    'قابلة للتلف',
    'هشة',
    'سائلة',
    'صلبة',
    'خطرة',
    'مجمدة',
    'مبردة',
    'ثقيلة',
    'خفيفة',
  ];

  String? selectedCargo;
  String? selectedSolid;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    final viewModel = ref.read(fieldsStateProvider.notifier);
    final state = ref.watch(fieldsStateProvider);
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
                          'وصف البضاعة',
                          style: TextStyle(
                            fontSize: 34.r,
                            fontFamily: 'tajawal',
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text("نوع البضاعة", style: titleLarge),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          // color: Colors.red,
                          height: 45.h,
                          child: DropdownButtonFormField<String>(
                            value: selectedCargo,
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
                                goodsTypes
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCargo = value;
                              });
                            },
                          ),
                        ),
                      ),

                      Text("حالة المادة", style: titleLarge),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          // color: Colors.red,
                          height: 45.h,
                          child: DropdownButtonFormField<String>(
                            value: selectedSolid,
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
                                materialConditions
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedSolid = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Text("نوع التعبئة", style: titleLarge),
                      SizedBox(height: 3.h),
                      // buildTextField(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: SizedBox(
                          // height: 45.h,
                          child: TextFormField(
                            cursorColor: AppColors.primaryColor,
                            onChanged: viewModel.onFirstChange,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Cairo',
                              // height: 1.5,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonColor,
                            ),
                            decoration: InputDecoration(
                              errorText: state.firstErrorMessage,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 5.w,
                              ),
                              filled: true,
                              fillColor: AppColors.secondaryColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),

                      Text("الوزن طن", style: titleLarge),
                      SizedBox(height: 3.h),
                      // buildTextField(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: SizedBox(
                          // height: 45.h,
                          child: TextFormField(
                            cursorColor: AppColors.primaryColor,
                            onChanged: viewModel.onSecondChange,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Cairo',
                              // height: 1.5,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonColor,
                            ),
                            decoration: InputDecoration(
                              errorText: state.secondErrorMessage,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 5.w,
                              ),
                              filled: true,
                              fillColor: AppColors.secondaryColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),
                      Text("مسمى البضاعة", style: titleLarge),
                      SizedBox(height: 3.h),
                      // buildTextField(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: SizedBox(
                          // height: 45.h,
                          child: TextFormField(
                            cursorColor: AppColors.primaryColor,
                            onChanged: viewModel.onThirdChange,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Cairo',
                              // height: 1.5,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonColor,
                            ),
                            decoration: InputDecoration(
                              errorText: state.thirdErrorMessage,

                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 5.w,
                              ),
                              filled: true,
                              fillColor: AppColors.secondaryColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
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
        // height: 45.h,
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
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 5.w,
            ),
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
