import 'package:flutter/services.dart';

class LsbPlugin {
  static const MethodChannel _channel = MethodChannel('lsb_plugin');

  static Future<Uint8List> encode(Uint8List bytes, Uint8List bytes1) async {
    try {
      final Uint8List encodedBytes = await _channel.invokeMethod('encode', {
        'bytes': bytes,
        'bytes1': bytes1,
      });
      return encodedBytes;
    } on PlatformException catch (e) {
      print("Error encoding: ${e.message}");
      rethrow;
    }
  }

  static Future<Uint8List> decode(Uint8List bytes) async {
    try {
      final Uint8List decodedBytes = await _channel.invokeMethod('decode', {
        'bytes': bytes,
      });
      return decodedBytes;
    } on PlatformException catch (e) {
      print("Error decoding: ${e.message}");
      rethrow;
    }
  }
}
