


import 'package:github_search/core/helper/api_url.dart';
import 'package:github_search/core/model/github_response.dart';
import 'package:github_search/core/service/api_service.dart';

class GithubRepository{

  final _apiService = ApiService(base_url);
  int perPage = 12;

  Future<GithubResponse> seachUser({String query, int start }) async {
    final response = await _apiService.call("users?q=$query&per_page=$perPage&page=$start",method: MethodRequest.GET);
    return GithubResponse.fromJson(response.data);
  }


}