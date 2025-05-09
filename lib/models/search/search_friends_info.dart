import '../user/friend_info.dart';

/// 搜索好友信息
class SearchFriendsInfo extends FriendInfo {
  late int relationship;

  SearchFriendsInfo({required this.relationship}) : super();

  SearchFriendsInfo.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    relationship = json['relationship'];
  }

  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['relationship'] = relationship;
    return data;
  }
}