import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/model/fields_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SenderInfoForm extends ConsumerStatefulWidget {
  const SenderInfoForm({super.key});

  @override
  ConsumerState<SenderInfoForm> createState() => _SenderInfoFormState();
}

class _SenderInfoFormState extends ConsumerState<SenderInfoForm> {
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
  List<String> arabPhoneCodes = [
    '+213', // الجزائر
    '+973', // البحرين
    '+269', // جزر القمر
    '+253', // جيبوتي
    '+20', // مصر
    '+964', // العراق
    '+962', // الأردن
    '+965', // الكويت
    '+961', // لبنان
    '+218', // ليبيا
    '+222', // موريتانيا
    '+212', // المغرب
    '+968', // عُمان
    '+970', // فلسطين
    '+974', // قطر
    '+966', // السعودية
    '+252', // الصومال
    '+249', // السودان
    '+963', // سوريا
    '+216', // تونس
    '+971', // الإمارات العربية المتحدة
    '+967', // اليمن
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
    // TextEditingController companNameController = TextEditingController();
    // TextEditingController resPhoneController = TextEditingController();
    // TextEditingController resNameController = TextEditingController();
    // bool isResNameControllerValid;
    // bool isResPhoneController;
    // bool isCompanNameController;
    final viewModel = ref.read(fieldsStateProvider.notifier);
    final state = ref.watch(fieldsStateProvider);

    return Directionality(
      textDirection: TextDirection.rtl,
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
                      'بيانات الشاحن',
                      style: TextStyle(
                        fontSize: 34.r,
                        fontFamily: 'tajawal',
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text("دولة الشاحن", style: titleLarge),
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
                  // buildDropdownField(['السعودية', 'مصر'], (value) {
                  //   setState(() => selectedCountry = value);
                  // },selectedCountry),
                  // SizedBox(height: 3.h),
                  Text("مدينة الشاحن", style: titleLarge),
                  SizedBox(height: 3.h),
                  // buildDropdownField(['الرياض', 'جدة'], (value) {
                  //   setState(() => selectedCity = value);
                  // }),
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
                  // SizedBox(height: 3.h),
                  Text("اسم مسئول الشحن", style: titleLarge),
                  SizedBox(height: 3.h),
                  // buildTextField(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: SizedBox(
                      // height: 45.h,
                      child: TextFormField(
                        onChanged: viewModel.onFirstChange,
                        // controller: resNameController,
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
                          errorText: state.firstErrorMessage,
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
                  Text("هاتف مسئول الشحن", style: titleLarge),
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
                          isDense: true,
                          errorText: state.secondErrorMessage,
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

                  // buildDropdownField(['+966', '+20'], (value) {
                  //   setState(() => selectedPhoneCode = value);
                  // }),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 12),
                  //   child: SizedBox(
                  //     // color: Colors.red,
                  //     height: 50.h,
                  //     child: DropdownButtonFormField<String>(
                  //       value: selectedPhoneCode,
                  //       borderRadius: BorderRadius.circular(5),
                  //       style: TextStyle(
                  //         fontFamily: "Cairo",
                  //         height: 1.5,

                  //         color: Colors.black,
                  //       ),
                  //       dropdownColor: Colors.white,
                  //       menuMaxHeight: 200,
                  //       decoration: InputDecoration(
                  //         isDense: true,
                  //         // labelText: label,
                  //         filled: true,

                  //         fillColor: AppColors.secondaryColor,
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide: BorderSide.none,
                  //         ),
                  //       ),
                  //       items:
                  //         phoneCodes
                  //               .map(
                  //                 (item) => DropdownMenuItem<String>(
                  //                   value: item,
                  //                   child: Text(item),
                  //                 ),
                  //               )
                  //               .toList(),
                  //       onChanged: (value) {
                  //         setState(() {
                  //           selectedPhoneCode = value;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Text("اسم الشركة المصدرة", style: titleLarge),
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

  // Widget buildDropdownField(List<String> items, Function(String?) onChanged, String selectedCountry) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 16),
  //     child: SizedBox(
  //       // color: Colors.red,
  //       height: 35.h,
  //       child: DropdownButtonFormField<String>(
  //         value: ,
  //         borderRadius: BorderRadius.circular(5),
  //         decoration: InputDecoration(
  //           // labelText: label,
  //           filled: true,
  //           fillColor: AppColors.secondaryColor,
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(5),
  //             borderSide: BorderSide.none,
  //           ),
  //         ),
  //         items:
  //             items
  //                 .map(
  //                   (item) => DropdownMenuItem<String>(
  //                     value: item,
  //                     child: Text(item),
  //                   ),
  //                 )
  //                 .toList(),
  //         onChanged: onChanged,
  //       ),
  //     ),
  //   );
  // }
}
