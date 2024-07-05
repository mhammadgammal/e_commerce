class RegisterParams {
  String? name;
  String email;
  String password;
  String? phoneNumber;

  RegisterParams(
      {this.name,
      this.phoneNumber,
      required this.email,
      required this.password,});
}
