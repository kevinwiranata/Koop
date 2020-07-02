import '../models/articleModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ArticleProvider{
  
  Future<List<ArticleModel>> fetchTopHeadlines() async{  
    String url = 'http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=3e7a1721e3ca45c28aad69546f4591a5';
    final response = await http.get(url);
    
    if(response.statusCode == 200){

      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article)=> ArticleModel.fromJSON(article)).toList();

    } else {
      throw Exception("Failed to get Top news");
    }
  }

}