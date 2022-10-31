import 'dart:convert';

import 'package:http/http.dart';
import 'package:pet_clinic_new/models/pet.dart';
import 'package:idoso_mais/services/user_service.dart';

class UserRepository {
  final UserService _userService = UserService();
  User _userMain = const User();

  static final UserRepository _userRepository = UserRepository._internal();

  factory UserRepository() {
    return _userRepository;
  }

  UserRepository._internal();

  User getUser() {
    return _userMain;
  }

  Future<void> loadUser() async {
    try {
      Response response = await _userService.get('');
      _userMain = User.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
