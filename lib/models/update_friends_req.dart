class UpdateFriendsReq {
  /// 群主用户 ID
  final String? ownerUserID;

  /// 好友用户 ID 列表
  final List<String>? friendUserIDs;

  /// 是否置顶
  final bool? isPinned;

  /// 备注
  final String? remark;

  /// 扩展信息
  final String? ex;

  UpdateFriendsReq({
    this.ownerUserID,
    this.friendUserIDs,
    this.isPinned,
    this.remark,
    this.ex,
  });

  UpdateFriendsReq.fromJson(Map<String, dynamic> json)
      : ownerUserID = json['ownerUserID'],
        friendUserIDs = json['friendUserIDs'],
        isPinned = json['isPinned'],
        remark = json['remark'],
        ex = json['ex'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ownerUserID'] = ownerUserID;
    data['friendUserIDs'] = friendUserIDs;
    data['isPinned'] = isPinned;
    data['remark'] = remark;
    data['ex'] = ex;
    return data;
  }

  @override
  String toString() {
    return 'UpdateFriendsReq{ownerUserID: $ownerUserID, friendUserIDs: $friendUserIDs, isPinned: $isPinned, remark: $remark, ex: $ex}';
  }
}