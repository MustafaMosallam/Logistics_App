import 'package:app/presentation/features/truck_owner_register/presentation/addDriver/welcome.dart';
import 'package:app/constants/app_assets.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/appBarPreferredSize.dart';
import 'package:app/presentation/shared/widgets/register_login_TextField.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverRegisterScreen extends StatefulWidget {
  const DriverRegisterScreen({super.key});

  @override
  State<DriverRegisterScreen> createState() => _DriverRegisterScreenState();
}

class _DriverRegisterScreenState extends State<DriverRegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  List<String> arabNationalities = [
    'جزائري',
    'بحريني',
    'قمري',
    'جيبوتي',
    'مصري',
    'عراقي',
    'أردني',
    'كويتي',
    'لبناني',
    'ليبي',
    'موريتاني',
    'مغربي',
    'عماني',
    'فلسطيني',
    'قطري',
    'سعودي',
    'صومالي',
    'سوداني',
    'سوري',
    'تونسي',
    'إماراتي',
    'يمني',
  ];

  String? selectedNat;
  @override
  void initState() {
    selectedNat = arabNationalities[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarContainerPreferredSize(context),
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0.h,
              horizontal: AppConstants.screenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.logoWithBg,
                  height: AppConstants.logoHeight.h,
                  width: AppConstants.logoWidth.w,
                ),
                SizedBox(height: 20.h),

                Text(
                  "ادخل بياناتك",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "الأسم كامل",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        // SizedBox(
                        //   height: AppConstants.RTextFieldHeight,
                        //   child: registerLoginTextField(
                        //     controller: _nameController,
                        //     validator: (value) {
                        //       return null;
                        //     },
                        //     keyboardType: TextInputType.name,
                        //   ),
                        // ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: buildTextField(),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "رقم الهاتف",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        // SizedBox(
                        //   height: AppConstants.RTextFieldHeight,
                        //   child: registerLoginTextField(
                        //     controller: _phoneController,
                        //     validator: (value) {
                        //       return null;
                        //     },
                        //     keyboardType: TextInputType.phone,
                        //   ),
                        // ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: buildTextField(),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "إختر الجنسية",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 3.h),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: SizedBox(
                              // color: Colors.red,
                              height: 45.h,
                              child: DropdownButtonFormField<String>(
                                value: selectedNat,
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
                                    arabNationalities
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedNat = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 37.h),
                themeButton(
                  context: context,
                  text: "التالي",
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddDriverWelcome(),
                        ),
                      );
                    });
                  },
                  color: AppColors.secondaryColor,
                  width: 150.w,
                  height: 53.h,
                  textcolor: Colors.black,
                ),
              ],
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
  // Widget buildDropdownField(List<String> items, Function(String?) onChanged) {
  //   return  Padding(
  //                   padding: const EdgeInsets.only(bottom: 12),
  //                   child: SizedBox(
  //                     // color: Colors.red,
  //                     height: 45.h,
  //                     child: DropdownButtonFormField<String>(
  //                       value: selectedCity,
  //                       borderRadius: BorderRadius.circular(5),
  //                       style: TextStyle(
  //                         fontSize: 16.sp,
  //                         fontFamily: 'Cairo',
  //                         height: 1.h,
  //                         fontWeight: FontWeight.w500,
  //                         color: AppColors.buttonColor,
  //                       ),
  //                       dropdownColor: Colors.white,
  //                       menuMaxHeight: 200,
  //                       decoration: InputDecoration(
  //                         isDense: true,
  //                         // labelText: label,
  //                         filled: true,

  //                         fillColor: AppColors.secondaryColor,
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(5),
  //                           borderSide: BorderSide.none,
  //                         ),
  //                       ),
  //                       items:
  //                           cities
  //                               .map(
  //                                 (item) => DropdownMenuItem<String>(
  //                                   value: item,
  //                                   child: Text(item),
  //                                 ),
  //                               )
  //                               .toList(),
  //                       onChanged: (value) {
  //                         setState(() {
  //                           selectedCity = value;
  //                         });
  //                       },
  //                     ),
  //                   ),
  //                 );
}
