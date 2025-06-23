import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:htca_app/screens/home/appointment/agora_video/video_call_controller.dart';

import 'agora_service.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<VideoCallController>(
        init: VideoCallController(),
        builder: (controller) {
          return Stack(
            children: [
              // Remote video view
              // _buildRemoteVideo(controller),

              // Local video view
              // _buildLocalVideo(),

              // Doctor info overlay
              _buildDoctorInfo(controller),

              // Call info overlay
              _buildCallInfo(controller),

              // Bottom controls
              _buildControls(controller),

              // Emergency notice
              _buildEmergencyNotice(),
            ],
          );
        },
      ),
    );
  }

  // Widget _buildRemoteVideo(VideoCallController controller) {
  //   return GetBuilder<AgoraService>(
  //     init: AgoraService(),
  //     builder: (agora) {
  //       if (agora.remoteUid != null) {
  //         return AgoraVideoView(
  //           controller: VideoViewController.remote(
  //             rtcEngine: agora.engine,
  //             canvas: VideoCanvas(uid: agora.remoteUid.value),
  //             connection: const RtcConnection(channelId: 'consultation_channel'),
  //           ),
  //         );
  //       } else {
  //         return Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               CircleAvatar(
  //                 radius: 50,
  //                 backgroundColor: Colors.blue[100],
  //                 child: Icon(Icons.person, size: 60, color: Colors.blue),
  //               ),
  //               SizedBox(height: 20),
  //               Text(
  //                 'Waiting for doctor to join...',
  //                 style: TextStyle(color: Colors.white, fontSize: 18),
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  // Widget _buildLocalVideo() {
  //   return Positioned(
  //     right: 20,
  //     top: 60,
  //     child: Container(
  //       width: 120,
  //       height: 180,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(color: Colors.white, width: 2),
  //       ),
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(8),
  //         child: AgoraVideoView(
  //           controller: VideoViewController(
  //             rtcEngine: Get.find<AgoraService>().engine,
  //             canvas: const VideoCanvas(uid: 0),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDoctorInfo(VideoCallController controller) {
    return Positioned(
      left: 20,
      top: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.doctorName.value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            controller.specialty.value,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildCallInfo(VideoCallController controller) {
    return Positioned(
      left: 20,
      top: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.callTitle.value,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.timer, color: Colors.white70, size: 16),
              SizedBox(width: 4),
              Text(
                controller.remainingTime.value,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(width: 16),
              Icon(Icons.wifi, color: Colors.green, size: 16),
              SizedBox(width: 4),
              Text(
                controller.connectionStatus.value,
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControls(VideoCallController controller) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mute button
          // CircleAvatar(
          //   radius: 28,
          //   backgroundColor: Colors.white24,
          //   child: IconButton(
          //     icon: Obx(() => Icon(
          //       controller.agoraService.isLocalUserMuted.value
          //           ? Icons.mic_off
          //           : Icons.mic,
          //       color: Colors.white,
          //       size: 28,
          //     )),
          //     onPressed: controller.toggleMute,
          //   ),
          // ),
          SizedBox(width: 40),
          // End call button
          // CircleAvatar(
          //   radius: 32,
          //   backgroundColor: Colors.red,
          //   child: IconButton(
          //     icon: Icon(Icons.call_end, color: Colors.white, size: 32),
          //     onPressed: controller.endCall,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildEmergencyNotice() {
    return Positioned(
      bottom: 100,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            'End-to-end encrypted call',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          SizedBox(height: 4),
          Text(
            'In case of emergency, dial 911',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}