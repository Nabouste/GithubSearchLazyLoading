import 'package:json_annotation/json_annotation.dart';

part 'github_items.g.dart';

@JsonSerializable(createToJson: false)
class GithubItems {
  String login;
  num id;
  String node_id;
  String avatar_url;
  String gravatar_id;
  String url;
  String html_url;
  String followers_url;
  String following_url;
  String gists_url;
  String starred_url;
  String subscriptions_url;
  String organizations_url;
  String repos_url;
  String events_url;
  String received_events_url;
  String type;
  bool site_admin;
  num score;


  GithubItems({this.login, this.id, this.node_id, this.avatar_url, this.gravatar_id, this.url, this.html_url, this.followers_url, this.following_url, this.gists_url, this.starred_url, this.subscriptions_url, this.organizations_url, this.repos_url, this.events_url, this.received_events_url, this.type, this.site_admin, this.score});

  factory GithubItems.fromJson(Map<String, dynamic> json) => _$GithubItemsFromJson(json);

  @override
  String toString() {
    return 'GithubItems{login: $login, id: $id, node_id: $node_id, avatar_url: $avatar_url, gravatar_id: $gravatar_id, url: $url, html_url: $html_url, followers_url: $followers_url, following_url: $following_url, gists_url: $gists_url, starred_url: $starred_url, subscriptions_url: $subscriptions_url, organizations_url: $organizations_url, repos_url: $repos_url, events_url: $events_url, received_events_url: $received_events_url, type: $type, site_admin: $site_admin, score: $score}';
  }
}
