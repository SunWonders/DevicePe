import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:get/get.dart';

class DeviceSliderCarousel extends StatefulWidget {
  List<String>? imgList = [];
  DeviceSliderCarousel({this.imgList, Key? key}) : super(key: key);

  @override
  _DeviceSliderCarouselState createState() =>
      _DeviceSliderCarouselState(imgList: imgList == null ? [] : imgList!);
}

class _DeviceSliderCarouselState extends State<DeviceSliderCarousel> {
  var imgList = <String>[].obs;

  _DeviceSliderCarouselState({required List<String> imgList}) {
    if (imgList.isEmpty) {
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
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          //   child: CarouselSlider(
          //     options: CarouselOptions(
          //       aspectRatio:
          //           MediaQuery.of(context).orientation == Orientation.portrait
          //               ? 16 / 9
          //               : 7,
          //       autoPlay: true,
          //       autoPlayInterval: Duration(seconds: 3),
          //     ),
          //     items: imgList
          //         .map(
          //           (item) =>
          //         )
          //         .toList(),
          //   ),
          // ),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              // return new Image.network(
              //   "http://via.placeholder.com/288x188",
              //   fit: BoxFit.fill,
              // );
              return Container(
                color: AppColors.whiteText,
                child: Center(
                  child: Image.network(
                    imgList[index],
                    width: 300,
                    fit: BoxFit.contain,
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
            },
            itemCount: imgList.length,
            viewportFraction: 0.8,
            scale: 0.9,
          )),
    );
  }
}
