import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EncryptVm extends ChangeNotifier {
  EncryptVm() {
    _init();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  _init() {}

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? response = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 400, maxWidth: 400);
    print(response);
    if (response != null) {
      _isLoading = true;
      notifyListeners();
    }
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
