class UserModel {
  final String fullName;

  UserModel({required this.fullName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['full_name'],
    );
  }
}