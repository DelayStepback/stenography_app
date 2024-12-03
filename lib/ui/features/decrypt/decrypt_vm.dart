import 'package:flutter/material.dart';

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
