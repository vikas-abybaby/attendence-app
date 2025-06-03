class HomeModel {
  int? count;
  String? title;
  String? routes;

  HomeModel({this.count, this.title, this.routes});

  HomeModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    title = json['title'];
    routes = json['routes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['title'] = title;
    data['routes'] = routes;
    return data;
  }
}
