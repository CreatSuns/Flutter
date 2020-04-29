import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';

class ImagePreviewPage extends StatefulWidget {
  ImagePreviewPage({
    @required this.initialIndex,
    @required this.items,
  }) : pageController = PageController(initialPage: initialIndex);

  final List items;
  final int initialIndex;
  final PageController pageController;
  @override
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImagePreview(
          provider: (BuildContext context, int index) {
            return AssetImage(widget.items[index]);
          },
          itemCount: widget.items.length),
    );
  }
}
