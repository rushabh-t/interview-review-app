class Name {
  String title;
  String first;
  String last;
  String name;

  Name({this.title, this.first, this.last, this.name});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
    name = '$title ' + '$first ' + '$last';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['first'] = this.first;
    data['last'] = this.last;
    data['name'] = '$this.title ' + '$this.first ' + '$this.last';
    return data;
  }
}
