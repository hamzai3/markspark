import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/utils/tools.dart';

class AppBarWidget extends StatelessWidget {
  Tools tools = Tools();

  final Color color;
  bool isback = false;
  bool isColored = false;
  final String title;

  AppBarWidget({Key key, this.isback,  this.title, this.color, this.isColored}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isColored ?  EdgeInsets.only(bottom: 0.0) :  EdgeInsets.only(bottom: 8.0) ,
      child: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        

        // backgroundColor:  getBrownColor(),
        // actionsForegroundColor: getWhit  eColor(),
        backgroundColor: color ?? white_color,
        automaticallyImplyLeading: false,

        transitionBetweenRoutes: isback ?? false,
        // // below line to remove line undr appbar
         border: Border(bottom: BorderSide(color: isColored ? Colors.transparent : grey_color)), 
        // trailing: GestureDetector(
        //   onTap: () {
        //     // Navigator.push(context,
        //     //     CupertinoPageRoute(builder: (context) => conversation()));
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Icon(
        //       Icons.chat,
        //       size: 25,
        //     ),
        //   ),
        // ),
        middle: Text(
          title,
          style: TextStyle(
              letterSpacing: 1.1,
              color: black_color,
              // fontWeight: FontWeight.bold,
              fontFamily: tools.getFontFamily(),
              fontSize: tools.getFontSizeLarge(context)),
        ),
      ),
    );
  }
}
