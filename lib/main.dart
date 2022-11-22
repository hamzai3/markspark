import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/screens/loginScreen.dart';
import 'package:markshark_mvc/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  const MyApp({Key key}) : super(key: key);

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(      
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () =>  SplashScreen()),
        GetPage(name: '/login', page: () =>  LoginScreen()),
      ],
      defaultTransition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 0),
    );
  }
}
