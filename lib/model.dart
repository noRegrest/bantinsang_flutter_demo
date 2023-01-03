class User {
  bool? status;
  Data? data;
  String? token;
  String? message;

  User({this.status, this.data, this.token, this.message});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Data {
  String? id;
  String? walletAddress;
  String? email;
  String? userName;
  String? role;

  Data({this.id, this.walletAddress, this.email, this.userName, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    walletAddress = json['WalletAddress'];
    email = json['Email'];
    userName = json['UserName'];
    role = json['Role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['WalletAddress'] = walletAddress;
    data['Email'] = email;
    data['UserName'] = userName;
    data['Role'] = role;
    return data;
  }
}
