import 'package:interview_review_app/data/model/name.dart';

class Results {
  Name name;
  String phone;
  String cell;

  Results({this.name, this.phone, this.cell});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    phone = json['phone'];
    cell = json['cell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['phone'] = this.phone;
    data['cell'] = this.cell;
    return data;
  }
}
