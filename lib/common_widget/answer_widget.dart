import 'package:flutter/material.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/utils/tools.dart';

class AnswerWidget extends StatelessWidget {
  AnswerWidget({Key key, this.answer, this.color}) : super(key: key);
  final String answer;
  final Color color;
  Tools tools = Tools();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color ?? light_grey_color_with_opacity,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                  fontFamily: tools.getFontFamily(),
                  fontWeight: FontWeight.bold,
                  color: black_color,
                ),
              ),
            ),
          ],
        ));
  }
}
