import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stenography_app/data/datasources/lsb_plugin.dart';

enum EncryptDataType { image, video, audio }

class EncryptVm extends ChangeNotifier {
  EncryptVm() {
    _init();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Uint8List? _encryptedData;
  Uint8List? get encryptedData => _encryptedData;

  EncryptDataType? _encryptDataType;
  EncryptDataType? get encryptDataType => _encryptDataType;

  final textEditiongController = TextEditingController();
  final focusNode = FocusNode();
  String? _inputError;
  String? get inputError => _inputError;

  _init() {}

  void clearInputError() {
    _inputError = null;
    notifyListeners();
  }

  Future<void> getImageFromPicker() async {
    if (textEditiongController.text.isEmpty) {
      _inputError = 'Введите текст';
      notifyListeners();
      return;
    }

    final ImagePicker picker = ImagePicker();
    final XFile? response = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 400, maxWidth: 400);

    if (response != null) {
      final bytesImage = await response.readAsBytes();
      encode(bytesImage, Uint8List.fromList(textEditiongController.text.codeUnits)).then((value) {
        _encryptDataType = EncryptDataType.image;
        notifyListeners();
      });
    } else {
      // todo handle error
    }
  }

  Future<void> encode(Uint8List value, Uint8List key) async {
    _isLoading = true;
    notifyListeners();

    _encryptedData = await LsbPlugin.encode(
      Uint8List.fromList(value),
      Uint8List.fromList(key),
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveEncryptedData() async {
    if (_encryptedData == null) {
      return;
    }
//
    // final directory = await getApplicationDocumentsDirectory();
    // final file = File('${directory.path}/encrypted_data${textEditiongController.text}.png');
    // await file.writeAsBytes(_encryptedData!);
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
