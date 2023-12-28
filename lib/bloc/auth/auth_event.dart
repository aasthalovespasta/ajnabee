// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ajnabee/repositories/firebase_repo.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize implements AuthEvent {
  final FirebaseRepository authRepository;
  const AuthEventInitialize({required this.authRepository});
}

class LogIn implements AuthEvent {
  final FirebaseRepository authRepository;
  final String email;
  final String password;
  const LogIn(
      {required this.email,
      required this.password,
      required this.authRepository});
}

class LogOut implements AuthEvent {
  final FirebaseRepository authRepository;
  const LogOut(
    this.authRepository,
  );
}

class Register implements AuthEvent {
  final FirebaseRepository authRepository;
  final String email;
  final String password;
  final int mobileNumber;
  final String name;
  const Register({
    required this.authRepository,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.name,
  });
}

class AuthEventGoToRegistration implements AuthEvent {
  const AuthEventGoToRegistration();
}

class AuthEventGoToLogin implements AuthEvent {
  const AuthEventGoToLogin();
}
