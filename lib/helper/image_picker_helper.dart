import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/common/custom_toast.dart';

class ImagePickerHelper {
  static Future<String?> pickImage(ImageSource source) async {
    bool? permissionGranted = await checkPermission();
    if (permissionGranted == true) {
      final ImagePicker picker = ImagePicker();
      // Pick an image
      final XFile? image = await picker.pickImage(
        source: source,
      );

      if (image != null) {
        int fileSize = await image.length();
        if (_getSizeInMB(fileSize) < 10) {
          String? imageUrl = await uploadFile(image.path);
          return imageUrl;
        } else {
          CustomToast.show(
            message: AppStrings.fileMustBeLessThan5MB,
          );
        }
      }
    }
    return null;
  }

  static double _getSizeInMB(int bytes) {
    double sizeInMB = bytes / (1024 * 1024);
    appPrint('${sizeInMB.toStringAsFixed(2)} MB');
    return sizeInMB;
  }

  static Future<String?> pickAndUploadFile() async {
    bool? permissionGranted = await checkPermission();
    Directory? libraryDirectory;
    if (Platform.isIOS) {
      // libraryDirectory = await getApplicationDocumentsDirectory();
      libraryDirectory = await getLibraryDirectory();
      // libraryDirectory = await getDownloadsDirectory();
    }
    if (permissionGranted == true) {
      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        // type: FileType.any,
        initialDirectory: libraryDirectory?.path,
        type: FileType.custom, // Customize the file types you want to allow
        allowedExtensions: [
          'pdf',
          'doc',
          'docx',
          'txt',
          'png',
          'jpg',
          'jpeg'
        ], // Allowed extensions
      );

      if (pickedFile != null) {
        int fileSize = pickedFile.files.first.size;
        if (_getSizeInMB(fileSize) < 50) {
          String? imageUrl = await uploadFile(pickedFile.files.first.path);
          return imageUrl;
        } else {
          CustomToast.show(
            message: AppStrings.fileMustBeLessThan50MB,
          );
        }
      }
    }
    return null;
  }

  static Future<bool> checkPermission() async {
    Map<Permission, PermissionStatus> permissionStatuses = await [
      Permission.camera,
      Permission.storage,
      Permission.photos,
    ].request();

    if (permissionStatuses[Permission.camera]!.isGranted && (permissionStatuses[Permission.storage]!.isGranted || permissionStatuses[Permission.photos]!.isGranted)) {
      return true;
    } else {
      CustomToast.show(
        message: AppStrings.permissionDenied,
      );
      return false;
    }
  }

  // static Future<String?> uploadImage(XFile? image) async {
  //   if (image != null) {
  //     FormData formData= await prepareFileFormData(image.path);
  //
  //     var resp = await APIService.instance.callApi(
  //       AppUrls.caseManagementUploadFile,
  //       APIMethods.post,
  //       data: formData,
  //       showLoader: true,
  //       options: Options(
  //         headers: {
  //           "Content-Type": "multipart/form-data",
  //           "Authorization":
  //               APIService.instance.dio.options.headers["authorization"]
  //         },
  //       ),
  //     );
  //     if (resp != null) {
  //       return resp['url'];
  //     }
  //   }
  //   return null;
  // }

  static Future<String?> uploadFile(String? filePath) async {
    if (filePath != null) {
      FormData formData = await prepareFileFormData(filePath);

      var resp = await APIService.instance.callApi(
        AppUrls.caseManagementUploadFile,
        APIMethods.post,
        data: formData,
        showLoader: true,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
            "Authorization":
                APIService.instance.dio.options.headers["authorization"]
          },
        ),
      );
      if (resp != null) {
        return resp['url'];
      }
    }
    return null;
  }

  static Future<FormData> prepareFileFormData(String filePath) async {
    // Detect the MIME type of the file dynamically
    String? mimeType = lookupMimeType(filePath);
    List<String> mimeTypeSplit =
        (mimeType ?? 'application/octet-stream').split('/');

    return FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        contentType: MediaType(mimeTypeSplit[0], mimeTypeSplit[1]),
      ),
    });
  }
}
