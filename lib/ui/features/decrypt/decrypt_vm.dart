import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:stenography_app/data/datasources/lsb_plugin.dart';

class DecryptVm extends ChangeNotifier {
  DecryptVm() {
    _init();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  _init() {
    _isLoading = true;
    notifyListeners();
  }

  bool _disposed = false;

  Future<Uint8List> decode(Uint8List value) async {
    Future<Uint8List> futureResult = LsbPlugin.decode(value);
    return futureResult;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
