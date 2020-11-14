// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubResponse _$GithubResponseFromJson(Map<String, dynamic> json) {
  return GithubResponse(
    total_count: json['total_count'] as num,
    incomplete_results: json['incomplete_results'] as bool,
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : GithubItems.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
