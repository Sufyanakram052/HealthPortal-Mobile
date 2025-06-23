// import 'package:national_ramp/constants/exports.dart';
// import 'package:pinput/pinput.dart';
//
// class CustomPinCode extends StatelessWidget {
//   const CustomPinCode({
//     super.key,
//     this.onCompleted,
//     this.onChanged,
//     this.controller,
//     this.isObscure = false,
//     this.autoFocus = true,
//     this.closeKeyboard = true,
//     this.length = 4,
//     this.validator,
//   });
//   final void Function(String)? onCompleted, onChanged;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   final bool isObscure, closeKeyboard, autoFocus;
//   final int length;
//
//   @override
//   Widget build(BuildContext context) {
//     final PinTheme defaultPinTheme = PinTheme(
//       width: 60.sp,
//       height: 60.sp,
//       padding: EdgeInsets.zero,
//       textStyle: Helper.textStyle(
//         color: isObscure ? context.primary : null,
//         size: 24,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12).r,
//         border: Border.all(
//           color: context.onSecondary.withOpacity(0.5),
//           width: 1.0.sp,
//         ),
//       ),
//     );
//
//     return Center(
//       child: Pinput(
//         length: length,
//         controller: controller,
//         obscureText: isObscure,
//         autofocus: autoFocus,
//         defaultPinTheme: defaultPinTheme,
//         onChanged: onChanged,
//         onSubmitted: onCompleted,
//         onCompleted: onCompleted,
//         validator: validator,
//         errorTextStyle: Helper.textStyle(
//           color: context.error,
//           size: 14,
//         ),
//       ),
//     );
//   }
// }
