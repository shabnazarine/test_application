import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemApi {
  static Future fetchJSON(context) async {
    var url = Uri.parse('https://us-central1-yellochat-12b69.cloudfunctions.net/sampleTestData');
    var response = await http.get(url);
    if (response.statusCode == 200){
      return response;
    }else{
      SnackBar snackBar = const SnackBar(
        content: Text('Unable to fetch data!!!!'),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}