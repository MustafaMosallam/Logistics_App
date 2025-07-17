//recipientInfoForm
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/model/fields_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipientInfoForm extends ConsumerStatefulWidget {
  const RecipientInfoForm({super.key});

  @override
  ConsumerState<RecipientInfoForm> createState() => _RecipientInfoFormState();
}

class _RecipientInfoFormState extends ConsumerState<RecipientInfoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> countries = [
    'الجزائر',
    'البحرين',
    'جزر القمر',
    'جيبوتي',
    'مصر',
    'العراق',
    'الأردن',
    'الكويت',
    'لبنان',
    'ليبيا',
    'موريتانيا',
    'المغرب',
    'عُمان',
    'فلسطين',
    'قطر',
    'السعودية',
    'الصومال',
    'السودان',
    'سوريا',
    'تونس',
    'الإمارات العربية المتحدة',
    'اليمن',
  ];
  List<String> cities = [
    'وهران',
    'الجزائر',
    'قسنطينة',
    'عنابة',
    'المنامة',
    'المحرق',
    'الرفاع',
    'سترة',
    'موروني',
    'فومبوني',
    'متساميولي',
    'جيبوتي',
    'تاجورا',
    'أوبوك',
    'علي صبيح',
    'القاهرة',
    'الإسكندرية',
    'أسوان',
    'الأقصر',
    'شرم الشيخ',
    'بغداد',
    'الموصل',
    'البصرة',
    'أربيل',
    'كربلاء',
    'عمان',
    'الزرقاء',
    'إربد',
    'العقبة',
    'مادبا',
    'الكويت',
    'الأحمدي',
    'الجهراء',
    'الفروانية',
    'بيروت',
    'طرابلس',
    'صيدا',
    'صور',
    'جونية',
    'طرابلس (ليبيا)',
    'بنغازي',
    'مصراتة',
    'البيضاء',
    'سبها',
    'نواكشوط',
    'نواذيبو',
    'روصو',
    'كيهيدي',
    'الرباط',
    'الدار البيضاء',
    'مراكش',
    'فاس',
    'طنجة',
    'مسقط',
    'صلالة',
    'نزوى',
    'صحار',
    'صور (عُمان)',
    'القدس',
    'رام الله',
    'غزة',
    'نابلس',
    'الخليل',
    'الدوحة',
    'الريان',
    'الخور',
    'الوكرة',
    'الرياض',
    'جدة',
    'مكة',
    'المدينة المنورة',
    'الدمام',
    'مقديشو',
    'هرجيسا',
    'بوصاصو',
    'جالكعيو',
    'الخرطوم',
    'أم درمان',
    'بورسودان',
    'كسلا',
    'نيالا',
    'دمشق',
    'حلب',
    'حمص',
    'اللاذقية',
    'طرطوس',
    'تونس',
    'صفاقس',
    'سوسة',
    'بنزرت',
    'قفصة',
    'أبوظبي',
    'دبي',
    'الشارقة',
    'العين',
    'رأس الخيمة',
    'صنعاء',
    'عدن',
    'الحديدة',
    'تعز',
    'مأرب',
  ];

  String? selectedCountry;
  String? selectedCity;
  String? selectedPhoneCode;

  @override
  void initState() {
    super.initState();
    selectedCountry = countries[0];
    selectedCity = cities[0];
    selectedPhoneCode = cities[0];
  }

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
                          'بيانات المستلم',
                          style: TextStyle(
                            fontSize: 34.r,
                            fontFamily: 'tajawal',
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text("دولة المستلم", style: titleLarge),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          // color: Colors.red,
                          height: 45.h,
                          child: DropdownButtonFormField<String>(
                            value: selectedCountry,
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
                                countries
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          ),
                        ),
                      ),
                      // SizedBox(height: 5.h),
                      Text("مدينة المستلم", style: titleLarge),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          // color: Colors.red,
                          height: 45.h,
                          child: DropdownButtonFormField<String>(
                            value: selectedCity,
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
                                cities
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCity = value;
                              });
                            },
                          ),
                        ),
                      ),
                      // SizedBox(height: 5.h),
                      Text("اسم مسئول التفريغ", style: titleLarge),
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

                      Text("هاتف مسئول التفريغ", style: titleLarge),
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
                      Text("اسم الشركة المستلمة", style: titleLarge),
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
                              isDense: true,
                              errorText: state.thirdErrorMessage,

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
