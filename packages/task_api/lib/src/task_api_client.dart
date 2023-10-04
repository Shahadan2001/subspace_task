
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_api/src/modals/base_response.dart';
class TaskApiClient{
  static const baseUrl = 'newsapi.org';

  final http.Client _httpClient;
///api key a320a0a7138541b282e571a4c609708a
  TaskApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? (http.Client());

  Future<List<BaseResponse>?> getTeslaHeadline({
    required String q,required String from, required String to,required String sortBy,required String domains,
  }) async{
      final teslaHeadlineUrl = Uri.https(baseUrl,'/v2/everything/',
          {'q':q,'from':from,'sortBy':sortBy, 'domains':domains,'apiKey':'a320a0a7138541b282e571a4c609708a'}
      );
      print(teslaHeadlineUrl);
      try{
        final response=await _httpClient.get(teslaHeadlineUrl);
        print(response.body);
        print('---Get Tesla Headline Response---');
        if(response.statusCode==200){
        List<BaseResponse>? result = [];
        for (var items in jsonDecode(response.body)['articles']) {
          result.add(BaseResponse.fromMap(items));
        }
        return result;
      }
    }catch(e,stackTrace){
          print(e);
      }
  }


  Future<List<BaseResponse>?> getTopHeadline({
    required String country,required String category, required String sources,
  }) async{
    final topHeadlineUrl = Uri.https(baseUrl,'/v2/top-headlines/',
        {'country':country,'category':category,'sources':sources, 'apiKey':'a320a0a7138541b282e571a4c609708a'}
    );
    print(topHeadlineUrl);
    try{
      final response=await _httpClient.get(topHeadlineUrl);
      print(response.body);
      print('---Get Top Headline Response---');
      if(response.statusCode==200){
        List<BaseResponse>? result = [];
        for (var items in jsonDecode(response.body)['articles']) {
          result.add(BaseResponse.fromMap(items));
        }
        return result;
      }
    }catch(e,stackTrace){
      print(e);
    }
  }
}