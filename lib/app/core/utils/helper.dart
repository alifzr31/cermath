import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Helper {
  Widget base64ToImage({required String base64}) {
    if (base64 != "") {
      final splitted = base64.split(',');
      Uint8List bytes = const Base64Decoder().convert(splitted[1]);
      return Image.memory(bytes);
    } else {
      return Container();
    }
  }
}
