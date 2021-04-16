import 'dart:ui';

import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class CommonUtility {
  hexStringToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  RichText convertHashtag(String text) {
    List<String> split = text.split(RegExp("#"));
    List<String> hashtags = split.getRange(1, split.length).fold([], (t, e) {
      var texts = e.split(" ");
      if (texts.length > 1) {
        return List.from(t)
          ..addAll(["#${texts.first}", "${e.substring(texts.first.length)}"]);
      }
      return List.from(t)..add("#${texts.first}");
    });
    return RichText(
      text: TextSpan(
        children: [TextSpan(text: split.first)]..addAll(hashtags
            .map((text) => text.contains("#")
                ? TextSpan(
                    text: text, style: TextStyle(color: AppColors.primaryLight))
                : TextSpan(
                    text: text, style: TextStyle(color: AppColors.blackText)))
            .toList()),
      ),
    );
  }

  Iterable<E> mapIndexed<E, T>(
      Iterable<T> items, E Function(int index, T item) f) sync* {
    var index = 0;

    for (final item in items) {
      yield f(index, item);
      index = index + 1;
    }
  }
}
