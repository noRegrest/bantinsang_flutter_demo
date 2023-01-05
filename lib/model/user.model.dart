class User {
  num? amount;
  String? token;
  String? userName;
  String? image;
  String? joinDate;

  User({this.amount, this.token, this.userName, this.image, this.joinDate});

  User.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    token = json['token'];
    userName = json['user_name'];
    image = json['image'];
    joinDate = json['join_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['token'] = token;
    data['user_name'] = userName;
    data['image'] = image;
    data['join_date'] = joinDate;
    return data;
  }
}
