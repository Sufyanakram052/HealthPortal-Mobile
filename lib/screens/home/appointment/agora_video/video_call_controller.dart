import 'package:get/get.dart';
import 'agora_service.dart';

class VideoCallController extends GetxController {
  // final AgoraService agoraService = Get.put(AgoraService());//<AgoraService>();
  final doctorName = 'Dr. Sarah Johnson'.obs;
  final specialty = 'Cardiologist'.obs;
  final callTitle = 'Follow-up Consultation'.obs;
  final remainingTime = '17:26 remaining'.obs;
  final connectionStatus = 'Stable WiFi'.obs;

  @override
  void onInit() {
    super.onInit();
    // _initCall();
  }

  // Future<void> _initCall() async {
  //   // Initialize Agora with your App ID
  //   await agoraService.initAgora('YOUR_AGORA_APP_ID');
  //
  //   // Join channel with token and channel name
  //   await agoraService.joinChannel(
  //       'YOUR_TOKEN',
  //       'consultation_channel',
  //       0 // User ID
  //   );
  // }
  //
  // void toggleMute() {
  //   agoraService.toggleMute();
  // }
  //
  // void endCall() {
  //   agoraService.leaveChannel();
  //   Get.back();
  // }

// Timer logic for remaining time would go here
}
