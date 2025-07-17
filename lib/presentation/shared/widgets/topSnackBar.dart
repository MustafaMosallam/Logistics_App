import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// void showSnackBarTop({
//   required context,
//   required Color bgColor,
//   required String message,
//   required Color textColor,
// }) {
//   showTopSnackBar(
//     Overlay.of(context),

//     CustomSnackBar.info(
//       backgroundColor: bgColor,
//       messagePadding: EdgeInsets.all(0),
//       icon: const SizedBox.shrink(),
//       message: message,
//       textStyle: TextStyle(color: textColor),
//     ),
//   );
// }

// void showTopMessage(
//   BuildContext context,
//   String message, {
//   Color bgColor = AppColors.secondaryColor,
// }) {
//   final overlay = Overlay.of(context);
//   final entry = OverlayEntry(
//     builder:
//         (context) => Positioned(
//           top: 50,
//           left: 20,
//           right: 20,
//           child: Material(
//             elevation: 8,
//             borderRadius: BorderRadius.circular(12),
//             color: bgColor,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 message,
//                 style: TextStyle(color: AppColors.buttonColor, fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//   );

//   overlay.insert(entry);
//   Future.delayed(const Duration(seconds: 3)).then((_) => entry.remove());
// }
