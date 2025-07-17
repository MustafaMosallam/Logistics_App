import 'dart:developer';

import 'package:app/constants/api_path.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/LegalInfo.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/screens/presentation/done_screen.dart';
import 'package:app/presentation/shared/widgets/themeButton.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pricequoteform extends StatefulWidget {
  const Pricequoteform({super.key});

  @override
  State<Pricequoteform> createState() => _PricequoteformState();
}

class _PricequoteformState extends State<Pricequoteform> {
  List<String> currencies = [
    'الدينار الجزائري',
    'الدينار البحريني',
    'فرنك جزر القمر',
    'الفرنك الجيبوتي',
    'الجنيه المصري',
    'الدينار العراقي',
    'الدينار الأردني',
    'الدينار الكويتي',
    'الليرة اللبنانية',
    'الدينار الليبي',
    'الأوقية الموريتانية',
    'الدرهم المغربي',
    'الريال العماني',
    'الشيكل الإسرائيلي (لفلسطين)',
    'الريال القطري',
    'الريال السعودي',
    'الشلن الصومالي',
    'الجنيه السوداني',
    'الليرة السورية',
    'الدينار التونسي',
    'الدرهم الإماراتي',
    'الريال اليمني',
  ];

  String? selectedCurrency;
  bool isChecked = false;
  double? finalValue;
  double? textvalue;
  bool isLoading = false;
  String? errorMessage;
  final Dio _dio = Dio();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedCurrency = currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    Future<void> submitPriceQuote() async {
      try {
        final response = await _dio.post(
          ApiPath.shipment,

          data: {
            "origin": {
              "address": "الأسكندرية",
              "coordinates": {"lat": 40.7128, "lng": -74.0060},
              "country": "مصر",
            },
            "destination": {
              "address": "الرفاع",
              "coordinates": {"lat": 34.0522, "lng": -118.2437},
              "country": "العراق",
            },
            "cargoDetails": {
              "description": "Electronics",
              "weight": 1000,
              "volume": 10,
              "category": "Electronics",
              "hazardous": false,
              "specialInstructions": "Handle with care",
            },
            "estimatedPickupDate": "2023-01-15T00:00:00.000Z",
            "estimatedDeliveryDate": "2023-01-20T00:00:00.000Z",
          },
          options: Options(
            headers: {
              "Authorization":
                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NjllMjgzZjFhMmRlMjNlNzk5NjUzYiIsImlhdCI6MTc1MjAzMjE2NSwiZXhwIjoxNzU0NjI0MTY1fQ.inV8FVSkDgCR-YI4-T11TGrbVBB3lOKxveoXi6hBP38",
              "Content-Type": "application/json",
            },
          ),
        );
        log("response: ${response}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          setState(() {
            isLoading = true;
            errorMessage = null;
          });
          // ✅ Success
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => const DoneScreen(
                    home: true,
                    donetext: "تم انشاء الشحنة بنجاح",
                  ),
            ),
          );
        } else {
          // ❌ Handle other response codes
          setState(() {
            errorMessage = "حدث خطأ أثناء إرسال البيانات. حاول مرة أخرى.";
          });
        }
      } catch (e) {
        log("error:$e");
        setState(() {
          errorMessage = "فشل الاتصال بالخادم: ${e.toString()}";
        });
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'عرض السعر',
                      style: TextStyle(
                        fontSize: 34.r,
                        fontFamily: 'tajawal',
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "السعر المعروض",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: SizedBox(
                                    // height: 45.h,
                                    child: TextFormField(
                                      // key: _formKey,
                                      onChanged: (value) {
                                        setState(() {
                                          if (value.isNotEmpty) {
                                            finalValue =
                                                double.parse(value) +
                                                (double.parse(value) * 0.03);
                                            textvalue = finalValue;
                                          }
                                        });
                                      },
                                      cursorColor: AppColors.primaryColor,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "هذا الحقل مطلوب";
                                        }
                                        return null; // input is valid
                                      },
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: 'Cairo',
                                        // height: 1.5,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.buttonColor,
                                      ),
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.h,
                                          horizontal: 5.w,
                                        ),
                                        filled: true,
                                        fillColor: AppColors.secondaryColor,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            Container(
                              width: 150.w,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<String>(
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'Cairo',
                                  height: 1.h,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttonColor,
                                ),
                                dropdownColor: Colors.white,
                                menuMaxHeight: 250.h,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: AppColors.buttonColor,
                                value: selectedCurrency,
                                isExpanded: true,
                                // hint: const Text(''),
                                items:
                                    currencies
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCurrency = value;
                                  });
                                },
                                underline: const SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'السعر الكلي',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  Text(
                    '• يرجى العلم أن السعر الإجمالي يشمل زيادة بنسبة 3% لتكلفة الخدمة\n'
                    '• لا تشمل تكلفة بطاقات الطرق أو تصاريح الشحن أو\n'
                    'إجراءات التأخير عند المناطق الحدودية',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttonColor,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      finalValue != null ? "$finalValue" : "",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (_) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                            if (isChecked) {
                              if (finalValue != null) {
                                setState(() {
                                  finalValue =
                                      finalValue! + (textvalue! * 0.03);
                                });
                              }
                            }
                            if (!isChecked) {
                              if (finalValue != null) {
                                setState(() {
                                  finalValue =
                                      finalValue! - (textvalue! * 0.03);
                                });
                              }
                            }
                          },
                          activeColor: Colors.orange,
                        ),
                        Expanded(
                          child: Text(
                            'في حالة طلب فاتورة الكترونية تزيد التكلفة بقيمة ٣%',
                            style: TextStyle(fontSize: 13.sp),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () {
                      if (isChecked) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LegalInfoScreen(),
                          ),
                        );
                      } else {
                        // showSnackBarTop(
                        //   context: context,
                        //   bgColor: AppColors.secondaryColor,
                        //   message: "قم بالموافقة علي زيادة التكلفة اولا",
                        //   textColor: Colors.white,
                        // );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        isChecked
                            ? AppColors.buttonColor
                            : AppColors.buttonColor.withValues(alpha: 0.3),
                      ),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppConstants.RButtonRadius,
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 353.w,
                      height: 53.h,
                      child: Text(
                        "طلب فاتورة الكترونية",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ElevatedButton(
                    onPressed: () async {
                      if (isChecked) {
                        // You can leave it empty or show an error message
                        // Or just do nothing
                        return;
                      }

                      if (_formKey.currentState!.validate()) {
                        await submitPriceQuote();

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder:
                        //         (context) => const DoneScreen(
                        //           home: true,
                        //           donetext: "تم انشاء الشحنة بنجاح",
                        //         ),
                        //   ),
                        // );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          isChecked
                              ? WidgetStateProperty.all(
                                AppColors.primaryColor.withValues(alpha: 0.3),
                              )
                              : WidgetStateProperty.all(AppColors.primaryColor),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppConstants.RButtonRadius,
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 240.w,
                      height: 63.h,
                      child:
                          isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                "انتهيت",
                                style: Theme.of(
                                  context,
                                ).textTheme.labelLarge?.copyWith(
                                  color: Colors.white,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
          onChanged: (value) {
            setState(() {
              finalValue = double.parse(value) + (double.parse(value) * 0.03);
              textvalue = finalValue;
            });
          },
          cursorColor: AppColors.primaryColor,

          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'Cairo',
            // height: 1.5,
            fontWeight: FontWeight.w600,
            color: AppColors.buttonColor,
          ),
          decoration: InputDecoration(
            isDense: true,
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
}
