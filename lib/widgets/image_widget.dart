import 'package:flutter/material.dart';
class ImageWidget extends StatelessWidget {
  var path;
  ImageWidget({this.path});
  @override
  Widget build(BuildContext context) {
    return    Image.network(
      path,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context,
          Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
