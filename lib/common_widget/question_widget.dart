import 'package:flutter/material.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/utils/tools.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  QuestionWidget({Key key, this.question}) : super(key: key);
  Tools tools = Tools();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: transperent_color,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: light_grey_color_with_opacity,
        ),
        child: Text(
          question,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.022,
            fontFamily: tools.getFontFamily(),
            fontWeight: FontWeight.bold,
            color: black_color,
            // backgroundColor: Color(0xffFACB21)
          ),
        ),
      ),
    );
  }
}
