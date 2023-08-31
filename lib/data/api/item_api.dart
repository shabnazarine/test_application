import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/item_model.dart';

class ItemApi {
  static Future fetchJSON() async {
    var url = Uri.parse('https://us-central1-yellochat-12b69.cloudfunctions.net/sampleTestData');
    var response = await http.get(url);
    if (response.statusCode == 200){
      return response;
    }
  }
}