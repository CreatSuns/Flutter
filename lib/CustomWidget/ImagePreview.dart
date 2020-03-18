import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagePreview extends StatefulWidget {
  ImagePreview({
    @required this.initialIndex,
    @required this.items,
}) : pageController = PageController(initialPage: initialIndex);

  final List items;
  final int initialIndex;
  final PageController pageController;
  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PhotoViewGallery.builder(
            scrollPhysics: BouncingScrollPhysics(),
            itemCount: widget.items.length,
//            pageController: widget.pageController,
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(widget.items[index]),
              );
            }
        ),
      ),
    );
  }
}


