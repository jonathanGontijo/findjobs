import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static String apiUrl =
      Platform.isAndroid
          ? dotenv.env["ANDROID_API_URL"] ?? 'No key'
          : dotenv.env['API_URL'] ?? 'No key';
}
