import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsResponse.dart';

import '../models/SoucesResponse.dart';

class ApiManager{
  static const String baseUrl='newsapi.org';
  static const String apiKey='12102f80b14c4881ae5655f53f4707b4';

  static Future<SourcesResponse> getSources(String categoryId)async{
    var url=Uri.https(baseUrl,"/v2/top-headlines/sources",{
      'apiKey':apiKey,
      'category':categoryId,
    });
     var response=await http.get(url);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }
  static Future<NewsResponse> getNews(String sourceId)async{
    var url=Uri.https(baseUrl,"v2/everything",{
      'apiKey':apiKey,
      'sources':sourceId,
    });
     var response=await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
//https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY