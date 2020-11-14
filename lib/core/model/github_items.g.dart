// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubItems _$GithubItemsFromJson(Map<String, dynamic> json) {
  return GithubItems(
    login: json['login'] as String,
    id: json['id'] as num,
    node_id: json['node_id'] as String,
    avatar_url: json['avatar_url'] as String,
    gravatar_id: json['gravatar_id'] as String,
    url: json['url'] as String,
    html_url: json['html_url'] as String,
    followers_url: json['followers_url'] as String,
    following_url: json['following_url'] as String,
    gists_url: json['gists_url'] as String,
    starred_url: json['starred_url'] as String,
    subscriptions_url: json['subscriptions_url'] as String,
    organizations_url: json['organizations_url'] as String,
    repos_url: json['repos_url'] as String,
    events_url: json['events_url'] as String,
    received_events_url: json['received_events_url'] as String,
    type: json['type'] as String,
    site_admin: json['site_admin'] as bool,
    score: json['score'] as num,
  );
}
