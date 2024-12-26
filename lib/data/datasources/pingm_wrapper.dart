// import 'package:flutter/services.dart';

// class PingmWrapper {
//   static const platform = MethodChannel('pingm_plugin');

//   Future<int> sum(int a, int b) async {
//     try {
//       final int result = await platform.invokeMethod('sum', {'a': a, 'b': b});
//       return result;
//     } on PlatformException catch (e) {
//       print("Failed to get sum: '${e.message}'.");
//       return -1;
//     }
//   }
// }
