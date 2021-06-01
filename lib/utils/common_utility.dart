import 'dart:collection';
import 'dart:ui';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  String hashMapToString(HashMap<int, dynamic> a) {
    HashMap<String, dynamic> newMap = HashMap.from(a.map((key, value) {
      //List<Option> values = List.from(value);
      return MapEntry("$key", value.toJson().toString());
    }));
    return newMap.toString();
  }

  String hashMapListToString(HashMap<int, dynamic> a) {
    HashMap<String, dynamic> newMap = HashMap.from(a.map((key, value) {
      List<dynamic> values = List.from(value);
      return MapEntry(
        "$key",
        values.map((theValue) {
          return theValue.toJson();
        }).toList(),
      );
    }));

    return newMap.toString();
  }

  String readTimestamp(int timestamp) {
    var now = new DateTime.now();
    var format = new DateFormat('dd-MM-yyyy HH:mm a');
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'DAY AGO';
      } else {
        time = diff.inDays.toString() + 'DAYS AGO';
      }
    }

    return time;
  }
}
