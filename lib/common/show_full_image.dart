import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowFullImage extends StatelessWidget {
  final String imageUrl;

  const ShowFullImage(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: Get.width,
        height: Get.height,
        margin: EdgeInsets.all(1.0),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Image.network(
          "$imageUrl",
          fit: BoxFit.fill,
          width: Get.width,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Image(
                image: AssetImage('assets/images/mobile.png'),
              ),
            );
          },
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
