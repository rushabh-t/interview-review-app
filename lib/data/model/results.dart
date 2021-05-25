import 'package:interview_review_app/data/model/name.dart';

class Results {
  Name name;
  String fullName;

  String cell;
  bool isAdded;

  Results({this.cell, this.isAdded = false, this.fullName});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;

    cell = json['cell'];
    fullName = name.name;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name.toJson().toString();
    }

    data['cell'] = this.cell;
    data['fullName'] = this.name;
    return data;
  }
}
