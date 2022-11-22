import 'package:flutter/material.dart';
import '../constants/expo_all_const.dart';


class VerticalSpacerWidget extends StatelessWidget {

  final double height;
  // final Color color;

  VerticalSpacerWidget({ Key key,  this.height }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: transperent_color,
    );
  }
}