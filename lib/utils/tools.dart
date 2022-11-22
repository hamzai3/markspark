import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tools {
  getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  // ______________________ Font Size __________________________
  getFontSizeSmall(context) {
    return MediaQuery.of(context).size.height * 0.018;
  }

  getFontSizeMedium(context) {
    return MediaQuery.of(context).size.height * 0.020;
  }

  getFontSizeLarge(context) {
    return MediaQuery.of(context).size.height * 0.022;
  }

  getFontSizeXLarge(context) {
    return MediaQuery.of(context).size.height * 0.026;
  }

  getFontSizeXXLarge(context) {
    return MediaQuery.of(context).size.height * 0.030;
  }


  // __________________________ Font Family __________________________ 
  getFontFamily() {
    return "Poppins";
  }
  

  // __________________________ Shared Prefrence __________________________ 
  
  Future<bool> setshared(String name, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(name, value);
    pref.commit();
    return true;
  }

  Future<String> getshared(String skey) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(skey).toString();
  } 
  
}
