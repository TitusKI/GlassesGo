import 'package:flutter/material.dart';
import 'package:glassesgo/views/common/values/colors.dart';

Widget catgButton(String catgName) {
  return Container(
      // margin: EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(onPressed: () {}, child: textName(catgName)));
}

textName(String text) {
  return Text(
    text,
    style: const TextStyle(color: AppColors.primaryText, fontSize: 10),
  );
}
