class GroupModel {
  int? id;
  String? name;
  String? description;
  String? avatarUrl;
  int? isGroup;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  GroupModel(
      {this.id,
      this.name,
      this.description,
      this.avatarUrl,
      this.isGroup,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    avatarUrl = json['avatar_url'];
    isGroup = json['is_group'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['avatar_url'] = avatarUrl;
    data['is_group'] = isGroup;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
