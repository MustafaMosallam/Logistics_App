import 'dart:developer';

import 'package:app/presentation/features/auth/register/register_state.dart';
import 'package:app/presentation/features/auth/register/register_viewmodel.dart';
import 'package:app/presentation/features/auth/register/user_role_model.dart';
import 'package:app/presentation/shared/screens/presentation/register_doneScreen.dart';
import 'package:app/presentation/features/truck_owner_register/presentation/registerData/welcome.dart';
import 'package:app/constants/app_assets.dart';
import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Usertype extends ConsumerWidget {
  Usertype({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(registerUserProvider.notifier);
    final state = ref.watch(registerUserProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: AppBar(),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            // vertical: 30.h,
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
              Text(
                "من انت ؟",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              customCard(
                title: "تاجر أو عميل",
                subtitle:
                    "لديك بضائع ترغب في شحنها من مكان لآخر. بصفتك تاجراً، تستطيع إنشاء الشحنات وإدارتها والتواصل مع مالكي الشاحنات لتوصيل بضائعك بأمان",
                icon: Icon(
                  Icons.person,
                  size: 40.r,
                  color: AppColors.primaryColor,
                ),
                context: context,
                onPressed: () async {
                  viewmodel.onChooseRole(UserRoleModel.merchant);

                  await viewmodel.register();

                  final state = ref.watch(registerUserProvider);
                  if (state.isLoading == false && context.mounted) {
                    if (state.token != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterDoneScreen(id: 0),
                        ),
                      );
                    } else {
                      log("Error: ${state.errorMessage}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage ?? "حدث خطأ"),
                        ),
                      );
                    }
                  }
                },
              ),
              customCard(
                title: "مالك شاحنة",
                subtitle:
                    "تمتلك شاحنة واحدة وتبحث عن عقود شحن. يتيح لك هذا الدور تقديم العروض على الشحنات وإدارتها لخدمة شاحنتك الوحيدة.",
                icon: Icon(
                  Icons.fire_truck,
                  size: 40.r,
                  color: AppColors.primaryColor,
                ),
                context: context,
                onPressed: () {
                  viewmodel.onChooseRole(UserRoleModel.truckOwner);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TruckDriverWelcome(isFleet: false),
                    ),
                  );
                },
              ),
              customCard(
                title: "مقاول سائقين أو شركة",
                subtitle:
                    "تدير عدة شاحنات وترغب في تنظيم عمليات الشحن على مستوى أوسع. يتيح لك هذا الدور إدارة أسطولك بالكامل. ودعوة السائقين. والإشراف على شحنات متعددة في وقت واحد.",
                icon: Icon(
                  Icons.house,
                  size: 40.r,
                  color: AppColors.primaryColor,
                ),
                context: context,
                onPressed: () {
                  viewmodel.onChooseRole(UserRoleModel.fleetOwner);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TruckDriverWelcome(isFleet: true),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
