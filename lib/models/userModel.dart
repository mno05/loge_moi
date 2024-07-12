class UserModel {
  int? id;
  String name = "";
  String? image;
  String email = "";
  String? password;

  UserModel({
    this.id,
    required this.name,
    this.image,
    required this.email,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    id == null ? "" : data['id'] = id;
    data['name'] = name;
    image == null ? "" : data['image'] = image;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
