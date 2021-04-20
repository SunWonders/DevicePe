import 'package:carousel_slider/carousel_slider.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceSliderCarousel extends StatefulWidget {
  final List<String> imgList;
  DeviceSliderCarousel({this.imgList, Key key}) : super(key: key);

  @override
  _DeviceSliderCarouselState createState() =>
      _DeviceSliderCarouselState(imgList: imgList);
}

class _DeviceSliderCarouselState extends State<DeviceSliderCarousel> {
  var imgList = <String>[].obs;

  _DeviceSliderCarouselState({List<String> imgList}) {
    if (imgList == null) {
      this.imgList = [
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-xr-black-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038992',
        'https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/apple/apple-iphone-xr/black/Apple-iPhoneXr-Black-2-3x.jpg'
      ].obs;
    } else {
      this.imgList = imgList.obs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      color: AppColors.whiteText,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 16 / 9
                  : 7,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
        ),
        items: imgList
            .map((item) => Container(
                  child: Center(
                    child: Image.network(
                      item,
                      width: 1000,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Image(
                            image: AssetImage('assets/images/mobile.png'),
                          ),
                        );
                      },
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
