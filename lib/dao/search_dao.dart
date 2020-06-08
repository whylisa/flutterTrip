import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:trip/model/seach_model.dart';

class SearchDao {
  static Future<SearchModel> fetch(String url, String text) async {
    final response = await http.get(url);
    if(response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));

      SearchModel model = SearchModel.fromJson(result);
      model.keyword = text;
      return model;
    }else {
      throw Exception('failed to load home_page.json');
    }
  }
}