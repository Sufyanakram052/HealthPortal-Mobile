// import 'package:national_ramp/constants/exports.dart';
//
// class CustomSearchWidget extends StatelessWidget {
//   const CustomSearchWidget(
//       {super.key, required this.onTap, required this.textController});
//   final TextEditingController textController;
//   final void Function(String) onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50.h,
//       padding: EdgeInsets.only(right: 10.sp, left: 10.sp),
//       child: Row(
//         children: [
//           Flexible(
//             child: CustomTextField(
//               maxLength: 30,
//               areaPadding: EdgeInsets.only(right: 20.sp, left: 10.sp),
//               controller: textController,
//               hintText: AppStrings.search,
//               textCapitalization: TextCapitalization.characters,
//               textInputAction: TextInputAction.next,
//               borderRadius: 16.r,
//               filledColor: context.cardColor,
//               contentPadding: EdgeInsets.zero,
//               onChanged: onTap,
//               prefixIcon: Padding(
//                 padding: EdgeInsets.all(14.sp),
//                 child: SvgPicture.asset(
//                   Assets.icons.search.path,
//                 ),
//               ),
//               // Icon(
//               //   Assets.icons.search.path,
//               //   color: AppColors.lightGrey,
//               //   size: 20.sp,
//               // ),
//               autoUnFocusEnable: false,
//               borderColor: Colors.transparent,
//             ),
//           ),
//           // InkWell(
//           //   onTap: onTap,
//           //   child: Container(
//           //     width: 48.h,
//           //     height: 48.h,
//           //     padding: EdgeInsets.all(12.sp),
//           //     decoration: BoxDecoration(
//           //       borderRadius: BorderRadius.circular(16.r),
//           //       color: context.primary,
//           //     ),
//           //     child: SvgPicture.asset(Assets.icons.submitSearch.path,),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
