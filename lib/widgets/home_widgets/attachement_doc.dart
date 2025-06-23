import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/colors.dart';
import 'package:htca_app/constants/strings.dart';
import 'package:htca_app/screens/home/records/record_controller.dart';
import 'package:htca_app/widgets/common/text_widget.dart';

class AttachmentsWidget extends StatelessWidget {
  const AttachmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordsController>(
      init: RecordsController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              AppStrings.attachments,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 12.h),

            // Add Files Button
            InkWell(
              onTap: controller.isLoading ? null : () => controller.addAttachment(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimary,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 1.w,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (controller.isLoading)
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: SizedBox(
                          width: 16.w,
                          height: 16.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    else
                      Icon(Icons.attach_file, size: 20.sp, color: AppColors.primary),
                    SizedBox(width: 8.w),
                    TextWidget(
                      controller.isLoading
                          ? AppStrings.uploading
                          : AppStrings.addFiles,
                      fontSize: 14.sp,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Attachments List
            if (controller.attachmentUrls.isNotEmpty) ...[
              ...controller.attachmentUrls.asMap().entries.map((entry) {
                final index = entry.key;
                final url = entry.value;
                return _buildAttachmentItem(url, index, controller);
              }).toList(),
              SizedBox(height: 16.h),
            ],
          ],
        );
      },
    );
  }

  Widget _buildAttachmentItem(String url, int index,RecordsController controller) {
    final fileName = url.split('/').last;
    final fileExtension = fileName.split('.').last.toLowerCase();

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.divColor),
      ),
      child: Row(
        children: [
          Icon(
            _getFileIcon(fileExtension),
            size: 24.sp,
            color: AppColors.primary,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextWidget(
              fileName,
              fontSize: 14.sp,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: Icon(Icons.remove_circle_outline, size: 20.sp, color: Colors.red),
            onPressed: () => controller.removeAttachment(index),
          ),
        ],
      ),
    );
  }

  IconData _getFileIcon(String extension) {
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return Icons.image;
      default:
        return Icons.insert_drive_file;
    }
  }
}