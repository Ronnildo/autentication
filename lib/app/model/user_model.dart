class UserModel {
  String? name;
  String? email;
  String? password;

  UserModel(
    this.name,
    this.email,
    this.password,
  );

  UserModel.fromJson(Map<String, dynamic> data) {
    name = data["name"];
    email = data["email"];
    password = data["password"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "email": email,
    };
    return map;
  }
}
