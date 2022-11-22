import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Apiconfig {
  static var timeoutrespon = {'status': false, 'message': 'timeout'};

  /* POST Method Funcion*/
  static Future<dynamic> post(url, [header, params]) async {
    // print('post');

    print(json.encode(params));
    try {
      final result
       = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response response = await http
            .post(
              Uri.parse(url),
              body: params,
              headers: <String, String>{
                'Content-Type': 'application/x-www-form-urlencoded',
              },
              encoding: Encoding.getByName('utf-8'),
            )
            .timeout(const Duration(minutes: 3));
        print('request url ${url}');
        print('responseBody ${response.body}');
        final responseBody = json.decode(response.body);

        return responseBody;
      }
    } on TimeoutException catch (e) {
      print('Timeout $e');
      return timeoutrespon;
    } on SocketException catch (e) {
      print('socketeee: $e');
      Get.snackbar(
        "No Internet",
        "Check Internet Connectivity",  
        duration: Duration(seconds: 1),      
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black45,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10)
      );     
      return timeoutrespon;
    } on Error catch (e) {
      print('in catch--');
      print('Error: $e');
    }
  }

/* GET Method Funcion*/
  static Future<dynamic> getMethod(url, [header, params]) async {
    print('////////;;;;;;;//////');
    print(url);
    try {
      http.Response response = await http
          .get(
            Uri.parse(url),
            headers: header,
          )
          .timeout(const Duration(seconds: 20));

      final statusCode = response.statusCode;
      if (statusCode != 200 || response.body == null) {
        throw TimeoutException(
            'An error ocurred : [Status Code : $statusCode]');
      }
      final responseBody = json.decode(response.body);

      return responseBody;
    } on TimeoutException catch (e) {
      print('Timeout $e');
      return timeoutrespon;
    } on SocketException catch (e) {
      print(e);
      return timeoutrespon;
    } on Error catch (e) {
      print('Error: $e');
    }
  }

/* PUT Method Funcion*/
  static Future<dynamic> putMethod(
    String url,
    Map<String, String> header, [
    body,
  ]) async {
    try {
      print('Response body is 0');
      http.Response response = await http
          .put(
            Uri.parse(url),
            headers: header,
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: 20));
      print('Response body is 1');
      final statusCode = response.statusCode;
      print('Response body is 2 $statusCode');
      if (statusCode != 200 || response.body == null) {
        throw TimeoutException(
            'An error ocurred : [Status Code : $statusCode]');
      }
      print('Response body is 3');
      final responseBody = json.decode(response.body);
      print('Response body is $responseBody');
      return responseBody;
    } on TimeoutException catch (e) {
      print('Timeout $e');
      return timeoutrespon;
    } on SocketException catch (e) {
      print(e);
      return timeoutrespon;
    } on Error catch (e) {
      print('Error: $e');
    }
  }

  static Future<dynamic> deleteMethod(
    String url,
    Map<String, String> header,
  ) async {
    try {
      http.Response response = await http
          .delete(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 20));
      final statusCode = response.statusCode;
      if (statusCode != 200 || response.body == null) {
        throw TimeoutException(
            'An error ocurred : [Status Code : $statusCode]');
      }
      final responseBody = json.decode(response.body);
      return responseBody;
    } on TimeoutException catch (e) {
      print('Timeout $e');
      return timeoutrespon;
    } on SocketException catch (e) {
      print(e);
      return timeoutrespon;
    } on Error catch (e) {
      print('Error: $e');
    }
  }
}
