abstract class SingupEvents {}

class SignupRequested extends SingupEvents {
  final String fullname;
  final String email;
  final String password;
  final String phone;

  SignupRequested({
    required this.fullname,
    required this.email,
    required this.password,
    required this.phone,
  });
}
