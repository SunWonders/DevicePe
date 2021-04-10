import 'package:carousel_slider/carousel_slider.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class DeviceSliderCarousel extends StatefulWidget {
  DeviceSliderCarousel({Key key}) : super(key: key);

  @override
  _DeviceSliderCarouselState createState() => _DeviceSliderCarouselState();
}

class _DeviceSliderCarouselState extends State<DeviceSliderCarousel> {
  final List<String> imgList = [
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-xr-black-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038992',
    //'https://images-na.ssl-images-amazon.com/images/I/717KHGCJ6eL._AC_SL1500_.jpg',
    'https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/apple/apple-iphone-xr/black/Apple-iPhoneXr-Black-2-3x.jpg'
  ];

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
                      child: Image.network(item,
                          fit: BoxFit.contain, width: 1000)),
                ))
            .toList(),
      ),
    );
  }
}
