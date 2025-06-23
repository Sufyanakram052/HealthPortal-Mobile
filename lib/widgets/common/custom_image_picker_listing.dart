// import 'package:htca_app/constants/exports.dart';
//
// class CustomImagePickerListing extends StatelessWidget {
//   const CustomImagePickerListing({
//     super.key,
//     required this.imageList,
//     this.onRemoveImage,
//     required this.onAddImage,
//     this.hideAddMoreButton = false,
//     required this.title,
//     this.subTitle,
//   });
//
//   final List<String> imageList;
//   final void Function(int index)? onRemoveImage;
//   final void Function() onAddImage;
//   final bool hideAddMoreButton;
//   final String title;
//   final String? subTitle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13).r,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8).r,
//         border: Border.all(
//           color: context.onSecondary.withOpacity(0.5),
//         ),
//       ),
//       child: imageList.isNotEmpty
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(
//                       Assets.icons.attachment.path,
//                       height: 20.sp,
//                     ),
//                     10.horizontalSpace,
//                     TextWidget(
//                       title, //AppStrings.images,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     const Spacer(),
//                     if (hideAddMoreButton != true)
//                       CustomIconButton(
//                         onTap: onAddImage,
//                         icon: SvgPicture.asset(
//                           Assets.icons.plus.path,
//                           height: 20.sp,
//                         ),
//                       )
//                   ],
//                 ),
//                 if (subTitle != null) ...[
//                   TextWidget(
//                     subTitle,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 12,
//                   )
//                 ],
//                 12.verticalSpace,
//                 SizedBox(
//                   height: 56.sp,
//                   child: ListView.builder(
//                     itemCount: imageList.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: EdgeInsets.only(right: 10.sp),
//                         child: Stack(
//                           alignment: Alignment.topRight,
//                           children: [
//                             Container(
//                               width: 56.sp,
//                               height: 56.sp,
//                               margin: EdgeInsets.only(right: 4.sp, top: 4.sp),
//                               decoration: BoxDecoration(
//                                 color: context.cardColor,
//                                 borderRadius: BorderRadius.circular(8).r,
//                                 border: Border.all(
//                                   color: context.onSecondary,
//                                 ),
//                                 image: DecorationImage(
//                                     image:
//                                         // FileImage(File(imageList[index])),
//                                         NetworkImage(imageList[index]),
//                                     fit: BoxFit.cover),
//                               ),
//                             ),
//                             CustomIconButton(
//                               padding: 0.sp,
//                               icon: SvgPicture.asset(
//                                 Assets.icons.closeIcon.path,
//                               ),
//                               onTap: () {
//                                 if (onRemoveImage != null) {
//                                   onRemoveImage!(index);
//                                 }
//                               },
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             )
//           : InkWell(
//               onTap: onAddImage,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SvgPicture.asset(
//                     Assets.icons.attachment.path,
//                     height: 20.sp,
//                   ),
//                   8.verticalSpace,
//                   TextWidget(
//                     title,
//                     // AppStrings.profile,
//                     fontWeight: FontWeight.w400,
//                     color: context.onSecondary.withOpacity(0.5),
//                   )
//                 ],
//               ),
//             ),
//     );
//   }
// }
