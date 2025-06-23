// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:get/get.dart';
//
// class AgoraService extends GetxController {
//   late final RtcEngine _engine;
//   RtcEngine get engine => _engine;
//   var remoteUid;
//   // final remoteUid = RxInt?>(null);
//   final isLocalUserMuted = false.obs;
//   final isJoined = false.obs;
//
//
//   Future<void> initAgora(String appId) async {
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(RtcEngineContext(appId: appId));
//
//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           isJoined.value = true;
//         },
//         onUserJoined: (connection, remoteUid, elapsed) {
//           this.remoteUid = remoteUid;
//           update();
//         },
//         onUserOffline: (connection, remoteUid, reason) {
//           this.remoteUid = null;
//           update();
//         },
//       ),
//     );
//   }
//
//   Future<void> joinChannel(String token, String channel, int uid) async {
//     await _engine.joinChannel(
//       token: token,
//       channelId: channel,
//       uid: uid,
//       options: ChannelMediaOptions(),
//     );
//   }
//
//   Future<void> leaveChannel() async {
//     await _engine.leaveChannel();
//     isJoined.value = false;
//     remoteUid = null;
//     update();
//   }
//
//   void toggleMute() {
//     isLocalUserMuted.value = !isLocalUserMuted.value;
//     _engine.muteLocalAudioStream(isLocalUserMuted.value);
//   }
//
//   @override
//   void onClose() {
//     _engine.release();
//     super.onClose();
//   }
//
//
//
//
//
//
// }