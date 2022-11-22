import 'package:flutter/material.dart';
import 'package:markshark_mvc/utils/tools.dart';

import '../constants/color_const.dart';

class ProfileMenu extends StatelessWidget {
  Tools tools = Tools();

  ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return
        // Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // child:
        MaterialButton(
            padding: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            // color: Color(0xfff8f8f8),
            onPressed: press,
            child: Row(
              children: [
                // SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontFamily: tools.getFontFamily(),
                      fontWeight: FontWeight.bold,
                      color: black_color,
                      // backgroundColor: Color(0xffFACB21)
                    ),
                  ),
                ),
                // Text(
                //     "EDIT",
                //     style: TextStyle(
                //       fontSize: MediaQuery.of(context).size.height * 0.022,
                //       fontFamily: tools.getFontFamily(),
                //       fontWeight: FontWeight.bold,
                //       color: Color(0xff1B3066),
                //       // backgroundColor: Color(0xffFACB21)
                //     ),
                //   ),
                //
                Icon(Icons.arrow_forward_ios)
              ],
            ));
    // )
    // ;
  }
}
