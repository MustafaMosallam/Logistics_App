import 'package:app/constants/app_constants.dart';
import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.screenPadding.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                'تواصل معنا',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(fontSize: 30.sp),
              ),
              const SizedBox(height: 10),
              Text(
                textDirection: TextDirection.rtl,
                'لا تتردد في التواصل معنا سواء كان لديك اقتراح لتحسين\nخدماتنا، شكوى لمناقشتها، أو مشكلة تحتاج إلى حل',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              Column(
                children: [
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'CALL US',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'متاحين دائما',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'تواصل معنا عبر وسائل التواصل الاجتماعي',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 15),
              _buildSocialMediaButton(
                icon: Icons.upload_outlined,
                text: 'تيليجرام',
                backgroundColor: Colors.white,
                textColor: AppColors.buttonColor,
                trailing: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
                onTap: () {
                  // Handle Telegram tap
                },
              ),
              const SizedBox(height: 10),
              _buildSocialMediaButton(
                icon: Icons.upload_outlined,
                text: 'واتس آب',
                availability: 'متاح',
                backgroundColor: Colors.white,
                textColor: Colors.black87,
                trailing: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.call, color: Colors.white, size: 30),
                  ),
                ),
                onTap: () {
                  // Handle WhatsApp tap
                },
              ),
              const SizedBox(height: 10),
              _buildSocialMediaButton(
                icon: Icons.upload_outlined,
                text: 'فيسبوك',
                details: '3,8K Followers  •  136 Posts',
                backgroundColor: Colors.white,
                textColor: Colors.black87,
                trailing: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.facebook, color: Colors.white, size: 30),
                  ),
                ),
                onTap: () {
                  // Handle Facebook tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaButton({
    required IconData icon,
    required String text,
    String? availability,
    String? details,
    required Color backgroundColor,
    required Color textColor,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.brown),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                    if (availability != null)
                      Text(
                        availability,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    if (details != null)
                      Text(
                        details,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }
}
