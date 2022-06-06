class account_model {
  int? status;
  List<Account>? account;

  account_model({this.status, this.account});

  account_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['account'] != null) {
      account = <Account>[];
      json['account'].forEach((v) {
        account!.add(Account.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (account != null) {
      data['account'] = account!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Account {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;

  Account({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;

    return data;
  }
}
