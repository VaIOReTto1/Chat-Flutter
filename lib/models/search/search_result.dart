import 'package:chat_flutter/models/search/search_result_items.dart';

/// 搜索结果
class SearchResult {
  /// 获取到的总消息数
  int? totalCount;

  /// 具体的搜索结果
  List<SearchResultItems>? searchResultItems;

  List<SearchResultItems>? findResultItems;

  SearchResult({this.totalCount, this.searchResultItems});

  SearchResult.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['searchResultItems'] != null) {
      searchResultItems = <SearchResultItems>[];
      json['searchResultItems'].forEach((v) {
        searchResultItems!.add(SearchResultItems.fromJson(v));
      });
    }
    if (json['findResultItems'] != null) {
      findResultItems = <SearchResultItems>[];
      json['findResultItems'].forEach((v) {
        findResultItems!.add(SearchResultItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    if (searchResultItems != null) {
      data['searchResultItems'] = searchResultItems!.map((v) => v.toJson()).toList();
    }
    if (findResultItems != null) {
      data['findResultItems'] = findResultItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}