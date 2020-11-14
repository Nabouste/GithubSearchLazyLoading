import 'package:github_search/core/model/github_items.dart';
import 'package:json_annotation/json_annotation.dart';
part'github_response.g.dart';

@JsonSerializable(createToJson: false)
class GithubResponse {


  num total_count;
  bool incomplete_results;
  List<GithubItems> items;

  GithubResponse({this.total_count, this.incomplete_results, this.items});

  factory GithubResponse.fromJson(Map<String, dynamic> json) => _$GithubResponseFromJson(json);
}