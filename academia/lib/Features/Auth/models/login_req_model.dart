class LoginRequestModel {
  final String userId;
  final String password;
  final bool rememberMe;

  LoginRequestModel({
    required this.userId,
    required this.password,
    required this.rememberMe,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "password": password,
      "rememberMe": rememberMe,
    };
  }
}