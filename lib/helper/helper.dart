import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
// import 'package:national_ramp/helper/image_picker_helper.dart';
// import 'package:soundpool/soundpool.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static TextStyle textStyle(
      {double? size, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: (size ?? 16).sp,
    );
  }

  static BorderRadius borderRadius({double? radius}) {
    return BorderRadius.circular(radius ?? 16).r;
  }

  static void vibrate() {
    // HapticFeedback.mediumImpact();
    HapticFeedback.vibrate();
  }

  // static Soundpool pool = Soundpool.fromOptions(
  //   options: const SoundpoolOptions(streamType: StreamType.notification),
  // );
  // static int? soundId;
  //
  // static Future<int?> loadSounds() async {
  //   soundId ??= await rootBundle.load(Assets.sounds.beep).then(
  //     (ByteData soundData) {
  //       return pool.load(soundData);
  //     },
  //   );
  //   appPrint("Loaded sounds id: $soundId");
  //   return soundId;
  // }

  // static void playBeep() async {
  //   // SystemSound.play(SystemSoundType.alert);
  //
  //   if (soundId != null) {
  //     int streamId = await pool.play(soundId!);
  //     appPrint("StreamId: $streamId");
  //   } else {
  //     await loadSounds();
  //     // playBeep();
  //   }
  // }

  static Future<bool> isConnected() async {
    // bool result = await InternetConnectionChecker().hasConnection;
    bool result = await InternetConnection().hasInternetAccess;
    return result;
  }

  static void urlLauncher(String? url) async {
    if (url != null && url.isNotEmpty) {
      if (url.isNotEmpty) {
        final Uri uri = Uri.parse(url);

        bool willLaunch = await canLaunchUrl(uri);

        if (willLaunch) {
          await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        }
      } else {
        appPrint("$url is not valid");
      }
    }
  }

  static String? encrypt(var str) {
    // encode
    var bytes = utf8.encode(str);
    String base64Str = base64.encode(bytes);
    appPrint(base64Str);
    return base64Str;
  }

  static String? decrypt(var str) {
    // decode
    var decodedBytes = base64.decode(str);
    String decodedStr = utf8.decode(decodedBytes);
    return decodedStr;
  }

  static int? fastHash(String? string) {
    if (string != null) {
      /// FNV-1a 64bit hash algorithm optimized for Dart Strings
      int hash = 0xcbf29ce484222325;

      int i = 0;
      while (i < string.length) {
        final codeUnit = string.codeUnitAt(i++);
        hash ^= codeUnit >> 8;
        hash *= 0x100000001b3;
        hash ^= codeUnit & 0xFF;
        hash *= 0x100000001b3;
      }

      return hash;
    } else {
      return null;
    }
  }

  static String enumToStringWithSpaces(String status) {
    return status.toString().split('.').last.replaceAllMapped(
          RegExp(r'(?<!^)(?=[A-Z])'),
          // Add space before capital letters except the first one
          (Match match) => ' ',
        );
  }
// }
}

void appPrint(value) {
  if (!kReleaseMode) {
    debugPrint("$value");
  }
}

class DeBouncer {
  static Timer? _timer;

  static void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 1000), action);
  }
}
