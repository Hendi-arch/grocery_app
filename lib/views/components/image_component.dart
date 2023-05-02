import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final Widget _imageWidget;

  ImageComponent.asset({super.key, required String image})
      : _imageWidget = Image.asset(image);

  ImageComponent.network(
      {super.key, required String image, Map<String, String>? headers})
      : _imageWidget = Image.network(image, headers: headers);

  ImageComponent.memory({super.key, required Uint8List bytes})
      : _imageWidget = Image.memory(bytes);

  @override
  Widget build(BuildContext context) {
    return _imageWidget;
  }
}
